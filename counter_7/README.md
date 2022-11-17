# TUGAS 7

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.

Stateless widget adalah adalah widget yang tidak akan pernah berubah. Stateless Widget  merupakan widget yang di-build hanya dengan konfigurasi yang telah diinisiasi sejak awal.Hal yang dimaksud tidak berubah adalah perubahan dalam variabel, icon, tombol atau pengambilan data tidak akan mengubah state dari aplikasi. Sehingga widget ini cocok untuk digunakan pada tampilan aplikasi yang bersifat statis.

Sedangkan statefull widget adalah merupakan Widget yang dapat berubah-ubah secara dinamis. Selama aplikasi berjalan, stateful widget akan secara dinamis merubah hal-hal tertentu pada aplikasi sesuai dengan kebutuhan developer. Salah satu method yang hanya bisa digunakan pada stateful widget adalah setState().

### Perbedaan
1. Statless widget bersifat statis, sedangkan stateful widget bersifat dinamis.
2. Statless widget lebih cocok digunakan pada tampilan aplikasi yang tidak memerlukan perubahan tampilan, sedangkan stateful widget lebih cocok digunakan untuk tampilan aplikasi yang memerlukan adanya perubahan. 
3. Penggunaan setState() hanya dapat diaplikasikan pada stateful widget.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
1. MaterialApp : adalah sebuah parent dimana yang diapitnya akan menerapkan style material design
2. Scaffold : Widget ini memiliki peran untuk mengatur struktur visual layout dengan mengimplementasikan material design
3. Text : Widget ini berfungsi untuk menampilkan text pada aplikasi
4. TextStyle : Widget ini berfungsi untuk memberikan styling pada text misalnya warna
5. FloatingActionButton: Widget ini berfungsi untuk membuat sebuah tombol

## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
setState() merupakan sebuah fungsi yang berguna untuk memberitahu widget bahwa ada objek yang berubah pada State sehingga aplikasi akan memuat ulang widget tersebut sesuai dengan nilai yang sudah diubah. Variabel yang dapat terdampak pada fungsi tersebut adalah variabel yang sifanya mutable dan terdeklarasi secara global di sebuah class.

##  Jelaskan perbedaan antara const dengan final
1. Pada inialisasi nilai dari variabelnya. const mengharuskan variabel harus diinialisasi pada saat kompilasi sedangkan final tidak mengharuskan variabel memiliki nilai secara eksplisit pada saat kompilasi
2. Nilai pada const tidak dapat memiliki nilai yang berbeda dalam variabel yang sama. Sedangkan final dapat memiliki nilai yang berbeda dalam variabel anggota yang sama.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Membuat program Flutter dengan menjalankan perintah flutter create counter_7
2. Membuat variabel counter pada class _MyHomePageState untuk menampilkan angka pada aplikasi
3. Membuat method _decrementCounter(), method ini akan mengurangi nilai pada counter. Ketika counter akan dikurangi dan menghasilkan -1 maka counter akan diset menjadi 0 (0 merupakan nilai maksimal decrement counter). Proses decrement variabel dilakukan dalam fungsi setState().
4. Membuat isi field FloatingAcitonButton sesuai dengan kebutuhan proyek, yaitu berisi 2 buah button dimana terdapat button decrement di kiri bawah dan button increment di kanan bawah. Kedua button tersebut juga disambungkan dengan properti onPressed.
5. Bind decrement functionnya pada onPressed props di button decrement dan bind function increment pada onPressed props di button increment
6. Membuat widget Text dan tambahkan handler ternary, ketika counter genap maka keluarkan Text Genap, else Text Ganjil
 

# TUGAS 8

## Jelaskan perbedaan `Navigator.push` dan `Navigator.pushReplacement`.
`Navigator.push` merupakan sebuah navigator yang digunakan untuk menambahkan route baru ke stack navigasi. Sedangkan `Navigator.pushReplacement` merupakan sebuah navigator routing yang berguna untuk mengganti route yang ada di stack navigasi dengan route baru. 

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- Scaffold : Widget ini memiliki peran untuk mengatur struktur visual layout dengan mengimplementasikan material design
- Drawer: widget yang berfungsi untuk membuat drawer di sisi kiri layar (untuk navigasi)
- Container: widget yang berfungsi sebagai container untuk menampung widget lainnya
- Column: widget yang berfungsi untuk menampung widget lainnya secara vertikal
- TextFormField : Widget ini berfungsi sebagai form dari text
- Center : Widget ini berfungsi untuk meletakkan widget didalamnya ke bagian tengah
- TextButton -> membuat tombol berbasis text untuk trigger datepicker
- Text : Widget ini berfungsi untuk menampilkan text pada aplikasi

## Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
- onTap: event yang terjadi ketika widget di tap
- onPressed: event yang terjadi ketika widget di tekan
- onChanged: event yang terjadi ketika widget diubah
- onSaved: event yang terjadi ketika widget disimpan

## Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Cara kerja method Navigator adalah dengan mengambil data-data routing dari pengguna dan mengolahnya dalam bentuk stack. Dikarenakan stack bersifat FIFO, maka data routing akan berganti sesuai dengan urutan FIFO, dan diolahnya dengan menggunakan Navigator.push dan Navigator.pop.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Membuat file drawer yang akan menjadi navbar untuk semua page
2. Membuat file tambah_budget untuk membuat form yang nantinya datanya bakal dimasukkin kedalam List yang ada di budget.
3. Pada budget, dibuat fungsi untuk menambahkan object pada atribut classnya untuk menampung data yang diinput pada form
4. Membuat file data_budget untuk menampilkan data. 