<div class="row">
    <div class="col-12">
        <div class="card">
            <form action="<?= base_url('karyawan/update') ?>" method="post">
                <div class="card-header">
                    <h4 class="card-title">Edit Karyawan</h4>
                </div>
                <div class="card-body border-top py-0 my-3">
                    <h4 class="text-muted my-3">Profil</h4>
                    <div class="row">
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <label for="nik">NIK : </label>
                                <input type="hidden" name="id_user" value="<?= $this->uri->segment(3) ?>">
                                <input type="text" name="nik" id="nik" value="<?= $karyawan->nik ?>" class="form-control" placeholder="Masukan NIK Karyawan" required="required" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <label for="nama">Nama Lengkap : </label>
                                <input type="text" name="nama" id="nama" value="<?= $karyawan->nama ?>" class="form-control" placeholder="Masukkan Nama Lengkap Karyawan" required="required" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 col-md-4">
                            <div class="form-group">
                                <label for="telp">No. Telp : </label>
                                <input type="tel" name="telp" id="telp" value="<?= $karyawan->telp ?>" class="form-control" placeholder="Masukkan No. Telp" required="required" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4">
                            <div class="form-group">
                                <label for="email">E-mail : </label>
                                <input type="email" name="email" id="email" value="<?= $karyawan->email ?>" class="form-control" placeholder="Masukkan Email" required="required" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-4">
                            <div class="form-group">
                                <label for="divisi">Bagian:</label>
                                <select name="divisi" id="divisi" class="form-control">
                                    <option value="" disabled selected>-- Pilih Divisi --</option>
                                    <?php foreach ($divisi as $d): ?>
                                        <option value="<?= $d->id_divisi ?>" <?= ($d->id_divisi == $karyawan->divisi) ? 'selected' : '' ?>>
                                            <?= $d->nama_divisi ?>
                                        </option>
                                    <?php endforeach; ?>
                                    <option value="1" <?= ($karyawan->divisi == 1) ? 'selected' : '' ?>>KETUA BADAN BAITUL MAL</option>
                                    <option value="2" <?= ($karyawan->divisi == 2) ? 'selected' : '' ?>>KASUBAG KEUANGAN & PROGRAM</option>
                                    <option value="3" <?= ($karyawan->divisi == 3) ? 'selected' : '' ?>>KASUBAG PENGEMBANGAN INFORMASI TEKNOLOGI</option>
                                    <option value="5" <?= ($karyawan->divisi == 5) ? 'selected' : '' ?>>KASUBAG UMUM & KEPEGAWAIAN</option>
                                    <option value="6" <?= ($karyawan->divisi == 6) ? 'selected' : '' ?>>TENAGA  AHLI PROFESIONAL</option>
                                </select>
                                <!-- Input untuk nama divisi manual -->
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body border-top py-0 my-3">
                    <h4 class="text-muted my-3">Akun</h4>
                    <div class="row">
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" name="username" id="username" value="<?= $karyawan->username ?>" class="form-control" placeholder="Masukkan Username" required="required" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" name="password" id="password" class="form-control" placeholder="********" />
                                <span class="text-danger">Tidak perlu diisi jika tidak ingin diganti!</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <button type="submit" class="btn btn-primary">Simpan <i class="fa fa-save"></i></button>
                </div>
            </form>
        </div>
    </div>
</div>
