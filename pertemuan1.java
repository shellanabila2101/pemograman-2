
    public class pertemuan1 {
    public static void main(String[] args) {
        long nim = 231011401016l;
        String nama = "Shellawati Nabila";
        double uts = 86;
        double uas = 70;

        // Hitung rata-rata
        double rata = (uts + uas) / 2;

        // Tentukan grade
        char grade;
        if (rata >= 85) {
            grade = 'A';
        } else if (rata >= 75) {
            grade = 'B';
        } else if (rata >= 65) {
            grade = 'C';
        } else if (rata >= 55) {
            grade = 'D';
        } else {
            grade = 'E';
        }

        // Output awal
        System.out.println("run:");
        System.out.println("data:");
        System.out.println("nim: " + nim);
        System.out.println("nama: " + nama);
        System.out.println("nilai UTS: " + (int)uts);
        System.out.println("nilai UAS: " + (int)uas);

        System.out.println("====================================================");

        // Header tabel
        System.out.printf("%-6s %-10s %-6s %-6s %-6s %-6s\n", 
        "Nim", "Nama", "UTS", "UAS", "Rata2", "Grade");

        System.out.println("====================================================");

        // Isi tabel
        System.out.printf("%-6d %-10s %-6.1f %-6.1f %-6.1f %-6c\n", 
        nim, nama, uts, uas, rata, grade);

        System.out.println("\nBUILD SUCCESSFUL");
    }
}

