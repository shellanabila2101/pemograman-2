package model;

public class Nilai {

    private String nim;
    private String nama;
    private String matkul;
    private int nilai;
    private String grade;

    public Nilai(String nim,
                  String nama,
                  String matkul,
                  int nilai,
                  String grade){

        this.nim = nim;
        this.nama = nama;
        this.matkul = matkul;
        this.nilai = nilai;
        this.grade = grade;
    }

    public String getNim(){
        return nim;
    }

    public String getNama(){
        return nama;
    }

    public String getMatkul(){
        return matkul;
    }

    public int getNilai(){
        return nilai;
    }

    public String getGrade(){
        return grade;
    }
}