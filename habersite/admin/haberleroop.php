<?php
 class Haberler
    {
       private $servername = "localhost";
        private $username   = "root";
        private $password   = "";
        private $database   = "haberler_db";
        public  $baglanti;
        public function __construct()
        {
            $this->baglanti = new mysqli($this->servername, 
                             $this->username, $this->password, 
                             $this->database);
            if($this->baglanti === false){
                die("Hata:" . $this->baglanti->connect_error);
            }else{
            return $this->baglanti;
            }
        }
        public function haberEkle($post)
         public function haberListe()
 {
    $sorgu = "SELECT * FROM haber_tablo";
    $veri = $this->baglanti->query($sorgu);
    if ($veri->num_rows > 0) {
       $haberler = array();
       while ($kayit = $veri->fetch_assoc()) 
       {
          $haberler[] = $kayit;
       }
       return $haberler;
    }
    else{
       echo "Kayıt bulunamadı.";
    }
 }
 {
  session_start();
  $kategori_id = $_POST['kategoriid'];
  $haber_baslik =$_POST['haberbaslik'];
  $haber_icerik =$_POST['habericerik'];
  $yazar_id = $_SESSION['yazar_id'];
  $sorgu="INSERT INTO haber_tablo(kategori_id,haber_baslik,haber_icerik,ya
 zar_id) VALUES('$kategori_id','$haber_baslik','$haber_icerik','$yazar_id')";
  $sonuc = $this->baglanti->query($sorgu);
  if ($sonuc==true) {
     header("Location:haberler.php");
  }else{
     echo "Kayıt işlemi başarısız!". $this->baglanti->error;
  }
 }

    
    public function haberSil($id)
 {
    $sorgu = "DELETE FROM haber_tablo WHERE haber_id = '$id'";
    $sonuc = $this->baglanti->query($sorgu);
    if ($sonuc==true) {
       header("Location:haberler.php");
     }else{
        echo "Haber silinemedi.";
     }
 }
 public function haberSec($id)
 {
    $sorgu = "SELECT * FROM haber_tablo WHERE haber_id = '$id'";
    $sonuc = $this->baglanti->query($sorgu);
    if ($sonuc->num_rows > 0) {
    $haber = $sonuc->fetch_assoc();
    return $haber;
    }else{
    echo "Kayıt bulunamadı.";
    }
 }
  public function haberDuzenle($post)
 {
    session_start();
    $haber_id = $_POST['id'];
    $kategori_id = $_POST['kategoriid'];
    $haber_baslik =$_POST['haberbaslik'];
    $haber_icerik =$_POST['habericerik'];
    $yazar_id = $_SESSION['yazar_id'];
    if (!empty($haber_id) && !empty($post)) {
        $sorgu = "UPDATE haber_tablo SET kategori_id = '$kategori_id', 
                    haber_baslik = '$haber_baslik', 
                    haber_icerik = '$haber_icerik',
                    yazar_id = '$yazar_id'
                    WHERE haber_id = $haber_id";
        $sonuc = $this->baglanti->query($sorgu);
        if ($sonuc==true) {
            header("Location:haberler.php");
            }else{
            echo "Güncelleme yapılamadı!.". $this->baglanti->error;
        }
        }
    
}

}
 ?>
 <?php 
 include ('haberleroop.php');
 include ('../includes/header.php');
 include ('../includes/navbaradmin.php');
 $haberObj = new Haberler();
 ?>
 <a href="haberekle.php" class='btn btn-primary'>Haber Ekle</a>
 <table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Haber Id</th>
      <th scope="col">Haber Başlık</th>
      <th scope="col">Haber Tarihi</th>
      <th scope="col">Sil</th>
      <th scope="col">Güncelle</th>
    </tr>
  </thead>
   <tbody>
        <?php 
          $haberler = $haberObj->haberListe(); 
          foreach ($haberler as $haber) 
          {
          echo "<tr>";
          echo "<td>".$haber['haber_id']."</td>";
          echo "<td>".$haber['haber_baslik']."</td>";
          echo "<td>".$haber['haber_tarih']."</td>";
          echo "<td><a class='btn btn-danger' 
         href='habersil.php?id=".$haber['haber_id']."'>Sil</a></td>";
          echo "<td><a class='btn btn-success' 
   href='haberduzenle.php?id=".$haber['haber_id']."'>Güncelle</a></td>";      
          echo "</td>";
          echo "</tr>";
         } 
         ?>
    </tbody>
  </table>

