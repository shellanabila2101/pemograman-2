public class pertemuan2 {

    public String nim, nama, grade;
    public float uts, uas;
    public double NilaiAkhir;

    public String getNim() {
        return nim;
    }

    public void setNim(String nim) {
        this.nim = nim;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public float getUts() {
        return uts;
    }

    public void setUts(float uts) {
        this.uts = uts;
    }

    public float getUas() {
        return uas;
    }

    public void setUas(float uas) {
        this.uas = uas;
    }

    public double getNilaiAkhir() {
        return (uts + uas) / 2;
    }

    public String getGrade() {
        double nilai = getNilaiAkhir();

        if (nilai < 50)
            return "E";
        else if (nilai < 60)
            return "D";
        else if (nilai < 70)
            return "C";
        else if (nilai < 80)
            return "B";
        else
            return "A";
    }

    public static void main(String[] args) {

        pertemuan2 mhs = new pertemuan2();

        mhs.setNim("2341011401016");
        mhs.setNama("Shellawati Nabila");
        mhs.setUts(87);
        mhs.setUas(60);

        System.out.println("run:");
        System.out.println("data:");
        System.out.println("nim: " + mhs.getNim());
        System.out.println("nama: " + mhs.getNama());
        System.out.println("nilai UTS: " + mhs.getUts());
        System.out.println("nilai UAS: " + mhs.getUas());

        System.out.println("====================================================");

        System.out.printf("%-6s %-10s %-6s %-6s %-6s %-6s\n",
                "Nim", "Nama", "UTS", "UAS", "Rata2", "Grade");

        System.out.println("====================================================");

        System.out.printf("%-6s %-10s %-6.1f %-6.1f %-6.1f %-6s\n",
                mhs.getNim(),
                mhs.getNama(),
                mhs.getUts(),
                mhs.getUas(),
                mhs.getNilaiAkhir(),
                mhs.getGrade());
    }
}