<style>
    .bg-white-smoke {
        background-color: #F5F5F5; /* Warna White Smoke */
    }

    #absen-table th {
        font-weight: bold;
    }

    #absen-table th:nth-child(1),
    #absen-table th:nth-child(2),
    #absen-table th:nth-child(3),
    #absen-table th:nth-child(4) {
        color: black;
        font-size: 13px;
    }


    /* Gaya umum untuk baris tabel */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    h2, p {
        margin-bottom: 10px;
    }

    /* Gaya untuk latar belakang hijau */
    .bg-success {
        background-color: #28a745 !important;
    }

    /* Gaya untuk teks putih */
    .text-white {
        color: #fff !important;
    }

    /* Gaya untuk latar belakang merah tua */
    .bg-danger {
        background-color: #dc3545 !important;
    }

    /* Gaya untuk teks biru */
    .text-primary {
        color: #007bff !important;
    }


</style>

<div class="row mb-2">
    <h4 class="col-xs-12 col-sm-6 mt-0">Detail Absen</h4>
    <div class="col-xs-12 col-sm-6 ml-auto text-right">
        <form action="" method="get">
            <div class="row">
                <div class="col">
                    <select name="bulan" id="bulan" class="form-control">
                        <option value="" disabled selected>-- Pilih Bulan --</option>
                        <?php foreach($all_bulan as $bn => $bt): ?>
                            <option value="<?= $bn ?>" <?= ($bn == $bulan) ? 'selected' : '' ?>><?= $bt ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="col ">
                    <select name="tahun" id="tahun" class="form-control">
                        <option value="" disabled selected>-- Pilih Tahun</option>
                        <?php for($i = date('Y'); $i >= (date('Y') - 5); $i--): ?>
                            <option value="<?= $i ?>" <?= ($i == $tahun) ? 'selected' : '' ?>><?= $i ?></option>
                        <?php endfor; ?>
                    </select>
                </div>
                <div class="col ">
                    <button type="submit" class="btn btn-primary btn-fill btn-block">Tampilkan</button>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header border-bottom">
                <div class="row">
                    <div class="col-xs-12 col-sm-6">
                        <table class="table border-0">
                            <tr>
                                <th class="border-0 py-0">Nama</th>
                                <th class="border-0 py-0">:</th>
                                <th class="border-0 py-0"><?= $karyawan->nama ?></th>
                            </tr>
                            <tr>
                                <th class="border-0 py-0">Divisi</th>
                                <th class="border-0 py-0">:</th>
                                <th class="border-0 py-0"><?= $karyawan->nama_divisi ?></th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>            
            <div class="card-body">
                <h4 class="card-title mb-4">Absen Bulan : <?= bulan($bulan) . ' ' . $tahun ?></h4>
                <!-- Tabel Absen -->
                <table id="absen-table" class="table table-striped table-bordered">
                    <thead>
                        <th>No</th>
                        <th>Tanggal</th>
                        <th>Jam Masuk</th>
                        
                    </thead>
                    <tbody>
                        <?php if($absen): ?>
                            <?php foreach($hari as $i => $h): ?>
                                <?php
                                    $absen_harian = array_search($h['tgl'], array_column($absen, 'tgl')) !== false ? $absen[array_search($h['tgl'], array_column($absen, 'tgl'))] : '';
                                    
                                    $query_jam_pulang = "SELECT id_user, tgl, waktu FROM absensi WHERE id_user = {$karyawan->id_user} AND tgl = '{$h['tgl']}' AND keterangan = 'Pulang'";
                                    $result_jam_pulang = $this->db->query($query_jam_pulang)->row();
                                ?>
                                <?php
                                    $is_weekday = !in_array($h['hari'], ['Sabtu', 'Minggu']);
                                    $is_today = $h['tgl'] == date('Y-m-d');
                                    $background_color = $is_today ? 'bg-success text-white' : ($is_weekday ? 'bg-gray' : '');
                                    $background_color .= $is_weekday ? ' bg-white-smoke' : ''; 
                                    $background_color = (!$background_color && !$absen_harian && !is_weekend($h['tgl'])) ? 'bg-success text-white' : $background_color;
                                    $background_color = (!$background_color && !$absen_harian && is_weekend($h['tgl'])) ? 'bg-danger text-white' : $background_color;
                                ?>
                                <tr class="<?= $background_color ?>">
                                    <td><?= ($i+1) ?></td>
                                    <td><?= $h['hari'] . ', ' . $h['tgl'] ?></td>
                                    <td><?= is_weekend($h['tgl']) ? 'Libur Akhir Pekan' : (is_array($absen_harian) ? check_jam(@$absen_harian['jam_masuk'], 'masuk') : 'Data Absen Tidak Tersedia') ?></td>
                                    
                                    
                                </tr>
                            <?php endforeach; ?>
                        <?php else: ?>
                            <tr>
                                <td class="bg-light" colspan="4">Tidak ada data absen</td>
                            </tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
            <div class="card-footer bg-white-smoke">
                <button class="btn btn-secondary" onclick="printTable()">Print Laporan</button>
            </div>
        </div>
    </div>
</div>

<script>
    function printTable() {
        var printWindow = window.open('', '_blank');
        printWindow.document.write('<html><head><title>Print</title>');
        printWindow.document.write('<style>');
        printWindow.document.write('body { font-family: Arial, sans-serif; }');
        printWindow.document.write('table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }');
        printWindow.document.write('th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }');
        printWindow.document.write('h2, p { margin-bottom: 10px; }');
        printWindow.document.write('.header { text-align: center; padding: 10px; background-color: #f2f2f2; }');
        printWindow.document.write('</style>');
        printWindow.document.write('</head><body>');

        printWindow.document.write('<div class="header">');
        printWindow.document.write('<h2>Baitul Mal Lhokseumawe</h2>');
        printWindow.document.write('<p>Jl. Teuku Hamzah Bendahara, Simpang Empat, Kec. Banda Sakti, Kota Lhokseumawe, Aceh 24313.</p>');
        printWindow.document.write('</div>');

        printWindow.document.write('<h2>Absen Bulan: <?= bulan($bulan) . ' ' . $tahun ?></h2>');
        printWindow.document.write('<p>Nama : <?= $karyawan->nama ?></p>');
        printWindow.document.write('<p>Divisi : <?= $karyawan->nama_divisi ?></p>');

        printWindow.document.write('<table>');
        printWindow.document.write(document.querySelector('#absen-table').innerHTML);
        printWindow.document.write('</table>');

        printWindow.document.write('</body></html>');
        printWindow.document.close();
        printWindow.print();
    }
</script>

