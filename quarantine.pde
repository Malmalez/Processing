import processing.serial.*;
Serial arduino, data;
PFont teks, teksKecil;
int val, val2;
boolean buttonRect = false;
boolean buttonRectSize = false;
boolean buttonRectRotate = false;
boolean buttonCirc = false;
boolean buttonCircSize = false;
boolean buttonCircArc = false;
boolean buttonTria = false;
boolean buttonTriaMode = false;
boolean buttonTriaModeSasi = false;
boolean buttonTriaModeSiku = false;
boolean buttonTriaModeRandom = false;
boolean buttonTriaRotate = false;

void setup() {  
  size(1100, 700);
  arduino=new Serial (this, "COM6", 9600);
  data=new Serial (this, "COM9", 9600);
  teks = loadFont("SegoeUI-20.vlw");
  frameRate(60);
}

void draw() {
  contoh();
  //persegi
  if (buttonRect) {
    arduino.write('1');
    println("1");
    delay(100);
    objek1Option();
  }
  if (buttonRectSize) {
    buttonRect=false;
    arduino.write('q');
    println("q");
    delay(100);
    val = data.read();
    objek1(val);
  }
  if (buttonRectRotate) {
    buttonRect=false;
    arduino.write('w');
    println("w");
    val = data.read();
    objek1(val);
  }
  //lingkaran
  if (buttonCirc) {
    arduino.write('2');
    println("2");
    delay(100);
    objek2Option();
  }
  if (buttonCircSize) {
    buttonCirc=false;
    arduino.write('e');
    println("e");
    delay(100);
    val = data.read();
    objek2(val);
  }
  if (buttonCircArc) {
    buttonCirc=false;
    arduino.write('r');
    println("r");
    delay(100);
    val = data.read();
    objek2(val);
  }
  //segitiga
  if (buttonTria) {
    arduino.write('3');
    println("3");
    delay(100);
    objek3Option();
  }
  if (buttonTriaMode) {
    buttonTria=false;
    arduino.write('t');
    println("t");
    delay(100);
    val = data.read();
    objek3(val);
  }
  if (buttonTriaRotate) {
    buttonTria=false;
    arduino.write('y');
    println("y");
    delay(100);
    val = data.read();
    objek3(val);
  }
  howtouse();
}
void objek1(int nilai) { ////////////////////////////////////////////////////////////persegi
  objek1Option();
  if (buttonRectSize) {
    fill(255, 255, 0);
    rectMode(CENTER);
    rect(width/2, height/2+70, nilai, nilai);
    rectMode(CORNER);
  }
  if (buttonRectRotate) {
    float muter = map(nilai+mouseY, 0, width, 0, TWO_PI);
    fill(255, 255, 0);
    pushMatrix();
    translate(width/2, height/2+70);
    rotate(muter);
    rectMode(CENTER);
    rect(0, 0, 100, 100);
    popMatrix();
  }
  rectMode(CORNER);
}
void objek1Option() {
  //kotak bantu
  fill(0);
  textFont(teks);
  textAlign(CENTER);
  text("Anda Memilih Objek Persegi", width/2, 290);
  fill(174);
  rect((width/2)-117, 305, 234, 234);

  //teksbantu
  fill(0);
  text("Ukuran :", (width/2)-(width/4)-100, 330);
  if (buttonRectSize) {
    fill(255, 0, 0);
    text("Gunakan Ping 1 untuk merubah Atribut", (width/2)+(width/4)+50, 370);
  } else fill(255, 255, 255);
  rect((width/2)-(width/4)-40, (height/2)-40, 80, 25);

  fill(0);
  text("Rotasi :", (width/2)-(width/4)-100, 530);
  if (buttonRectRotate) {
    fill(255, 0, 0);
    text("Gunakan Ping 2 untuk merubah Atribut", (width/2)+(width/4)+50, 470);
  } else fill(255, 255, 255);
  rect((width/2)-(width/4)-40, (height/2)+160, 80, 25);
}
void objek2(int nilai) { ////////////////////////////////lingkaran
  objek2Option();
  if (buttonCircSize) {
    fill(255, 0, 255);
    ellipse(width/2, height/2+70, 10+nilai, 10+nilai);
  }
  if (buttonCircArc) {
    fill(255, 0, 255);
    if (nilai >= 0 && nilai <51 ) arc(width/2, height/2+70, 100, 100, 0, QUARTER_PI);
    if (nilai >= 51 && nilai <102 ) arc(width/2, height/2+70, 100, 100, 0, HALF_PI);
    if (nilai >= 102 && nilai <153 ) arc(width/2, height/2+70, 100, 100, 0, PI); 
    if (nilai >= 153 && nilai <203 ) arc(width/2, height/2+70, 100, 100, 0, HALF_PI+PI);
    if (nilai == 204) arc(width/2, height/2+70, 100, 100, 0, PI+PI);
  }
}
void objek2Option() {
  //kotak bantu
  fill(0);
  textFont(teks);
  textAlign(CENTER);
  text("Anda Memilih Objek Lingkaran", width/2, 290);
  fill(174);
  rect((width/2)-117, 305, 234, 234);

  //teksbantu
  fill(0);
  text("Ukuran :", (width/2)-(width/4)-100, 360);
  if (buttonCircSize) {
    fill(255, 0, 0);
    text("Gunakan Ping 1 untuk merubah Atribut", (width/2)+(width/4)+50, 370);
  } else fill(255, 255, 255);
  rect((width/2)-(width/4)-40, (height/2)-10, 80, 25);

  fill(0);
  text("Bentuk :", (width/2)-(width/4)-100, 500);
  if (buttonCircArc) {
    fill(255, 0, 0);
    text("Gunakan Ping 2 untuk merubah Atribut", (width/2)+(width/4)+50, 470);
  } else fill(255, 255, 255);
  rect((width/2)-(width/4)-40, (height/2)+130, 80, 25);
}
void objek3(int nilai) { ////////////////////////////////////////////////////////////persegi
  objek3Option();
  if (buttonTriaMode) {
    fill(255, 0, 0);
    textAlign(LEFT);
    text("Pilih jenis Segitiga", (width/2)+130, 330);
    textFont(teks,15);
    text(" =   Segitiga Sama Sisi", (width/2)+220, 385);
    text(" =   Segitiga Siku-Siku", (width/2)+220, 415);
    text(" =   Segitiga Sembarang", (width/2)+220, 445);
    if (buttonTriaModeSasi) {
      fill(0,255,255);
      pushMatrix();
      translate(width/2, height/2+70);
      triangle(0, -60, -80, 30, 80, 30);
      popMatrix();
      fill(255, 0, 0);
      text("Jika ingin memilih yang lain : Nonaktifkan -> Pilih yang lain", (width/2)+130, 530);
    } else fill(255);
    rect((width/2)+130, 370, 80, 25);
    if (buttonTriaModeSiku) {
      fill(0,255,255);
      pushMatrix();
      translate(width/2, height/2+70);
      triangle(-60, -60, -60, 80, 80, 80);
      popMatrix();
      fill(255, 0, 0);
      text("Jika ingin memilih yang lain : Nonaktifkan -> Pilih yang lain", (width/2)+130, 530);
    } else fill(255);
    rect((width/2)+130, 400, 80, 25);
    if (buttonTriaModeRandom) {
      fill(0,255,255);
      pushMatrix();
      translate(width/2, height/2+70);
      triangle(random(-100,100),random(-100,100),random(-100,100),random(-100,100),random(-100,100),random(-100,100));
      popMatrix();
      fill(255, 0, 0);
      text("Jika ingin memilih yang lain : Nonaktifkan -> Pilih yang lain", (width/2)+130, 530);
    } else fill(255);
    rect((width/2)+130, 430, 80, 25);
  
  }
  if (buttonTriaRotate) {
    float muter = map(nilai+mouseY, 0, width/2, 0, TWO_PI);
    fill(0, 255, 255);
    pushMatrix();
    translate(width/2, height/2+70);
    rotate(muter);
    triangle(0, -60, -80, 30, 80, 30);
    popMatrix();
  }
}
void objek3Option() {
  //kotak bantu
  fill(0);
  textFont(teks);
  textAlign(CENTER);
  text("Anda Memilih Objek Segitiga", width/2, 290);
  fill(174);
  rect((width/2)-117, 305, 234, 234);

  //teksbantu
  fill(0);
  text("Mode :", (width/2)-(width/4)-100, 390);
  if (buttonTriaMode) {
    fill(255, 0, 0);
  } else fill(255, 255, 255);
  rect((width/2)-(width/4)-40, (height/2)+20, 80, 25);

  fill(0);
  text("Rotasi :", (width/2)-(width/4)-100, 470);
  if (buttonTriaRotate) {
    fill(255, 0, 0);
    text("Gunakan Ping 2 untuk merubah Atribut", (width/2)+(width/4)+50, 470);
  } else fill(255, 255, 255);
  rect((width/2)-(width/4)-40, (height/2)+100, 80, 25);
}
void mousePressed() {
  //buat persegi
  if (mouseX > 183 && mouseX < 263 && mouseY > 220 && mouseY < 245) {
    buttonRect = !buttonRect;
  } else if (mouseX > 235 && mouseX < 315 && mouseY > 310 && mouseY < 335) {
    buttonRectSize = !buttonRectSize;
  } else if (mouseX > 235 && mouseX < 315 && mouseY > 510 && mouseY < 535) {
    buttonRectRotate = !buttonRectRotate;
  }
  //buat lingkaran
  else if (mouseX > 510 && mouseX < 590 && mouseY > 220 && mouseY < 245) {
    buttonCirc = !buttonCirc;
  } else if (mouseX > 235 && mouseX < 315 && mouseY > 340 && mouseY < 365) {
    buttonCircSize = !buttonCircSize;
  } else if (mouseX > 235 && mouseX < 315 && mouseY > 480 && mouseY < 505) {
    buttonCircArc = !buttonCircArc;
  }

  //buat segitiga
  else if (mouseX > 877 && mouseX < 957 && mouseY > 220 && mouseY < 245) {
    buttonTria = !buttonTria;
  } else if (mouseX > 235 && mouseX < 315 && mouseY > 370 && mouseY < 395) {
    buttonTriaMode = !buttonTriaMode;
  } else if (mouseX > 235 && mouseX < 315 && mouseY > 450 && mouseY < 475) {
    buttonTriaRotate = !buttonTriaRotate;
  }
  //buat mode segitiga
  else if (mouseX > 680 && mouseX < 760 && mouseY > 370 && mouseY < 395) {
    buttonTriaModeSasi = !buttonTriaModeSasi;
  }
  else if (mouseX > 680 && mouseX < 760 && mouseY > 400 && mouseY < 425) {
    buttonTriaModeSiku = !buttonTriaModeSiku;
  }
  else if (mouseX > 680 && mouseX < 760 && mouseY > 430 && mouseY < 465) {
    buttonTriaModeRandom = !buttonTriaModeRandom;
  }
}
void contoh() {
  background(174);
  fill(0);
  textFont(teks);
  textAlign(CENTER);
  text("SISTEM PENGATURAN OBJEK PROCESSING MENGGUNAKAN SENSOR PING PADA ARDUINO", width/2, 30);

  //header row
  line(0, 40, width, 40);

  //garis pembagi
  line(width/3, 40, width/3, 260);
  line(width-(width/3), 40, width-(width/3), 260);

  //navbar row
  line(0, 260, width, 260);

  //footer row
  line(0, 570, width, 570);

  //teks buat contoh
  textAlign(CENTER);
  textFont(teks, 17);
  text("PERSEGI", (width/2)-(width/3), 70);  
  text("LINGKARAN", width/2, 70);
  text("SEGITIGA", (width/2)+(width/3), 70);

  textFont(teks, 13);
  text("Ubah Ukuran Objek | Putar Objek", (width/2)-(width/3), 210);
  text("Ubah Ukuran Objek | Ubah Bentuk Objek", width/2, 210);
  text("Ubah Jenis Objek | Putar Objek", (width/2)+(width/3), 210);

  //contoh rectangle
  fill(255, 255, 0);
  stroke(0);
  rectMode(CENTER);
  rect((width/2)-(width/3), 130, 100, 100);
  rectMode(CORNER);
  if (buttonRect) fill(255, 0, 0);
  else fill(255, 255, 255);
  rect((width/2)-(width/3)-40, 220, 80, 25);

  //contoh ellipse
  fill(255, 0, 255);
  stroke(0);
  ellipse(width/2, 130, 100, 100);
  if (buttonCirc) fill(255, 0, 0);
  else fill(255, 255, 255);
  rect((width/2)-40, 220, 80, 25);

  //contoh triangle
  fill(0, 255, 255);
  stroke(0);
  triangle((width/2)+(width/3), 80, 837, 180, 997, 180);
  if (buttonTria) fill(255, 0, 0);
  else fill(255, 255, 255);
  rect((width/2)+(width/3)-40, 220, 80, 25);
}
void howtouse() {
  fill(0);
  textFont(teks, 18);
  textAlign(LEFT);
  text("Cara menggunkaan program ini:", 20, 595);
  textFont(teks, 15);
  text("1. Pilih salah satu objek", 20, 620);
  text("2. Pilih salah satu atribut yang akan di rubah", 20, 640);
  text("3. Ubah nilai sensor PING di Arduino", 20, 660);
  text("4. Matikan Atribut jika hendak memilih objek lain", 20, 680);
  line(width/2, 570, width/2, height);
  textFont(teks, 18);
  textAlign(LEFT);
  text("Catatan:", (width/2)+20, 595);
  textFont(teks, 15);
  text("- Nonaktifkan objek sebelumnya jika ingin mengubah objek yang lain", (width/2)+20, 620);
  text("- Karena menggunakan simulasi, perubahan tidak terjadi secara real time", (width/2)+20, 640);
  text("- Keterangan Tombol = ON = MERAH | OFF = PUTIH", (width/2)+20, 660);
  text("- Akan ada sedikit delay ketika menekan tombol, mohon bersabar", (width/2)+20, 680);
}
