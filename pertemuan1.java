import java.util.Scanner;
public class pertemuan1 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        // Input data mahasiswa
        System.out.println("run:");
        System.out.println("data:");
        System.out.print("nim: ");
        String nim = input.nextLine();

        System.out.print("nama: ");
        String nama = input.nextLine();

        System.out.print("nilai UTS: ");
        double uts = input.nextDouble();

        System.out.print("nilai UAS: ");
        double uas = input.nextDouble();

        System.out.print("nilai Tugas: ");
        double tugas = input.nextDouble();

        // Output
        double nilaiAkhir = (uts * 0.3) + (uas * 0.3) + (tugas * 0.4);
        System.out.println("Nilai Akhir: " + nilaiAkhir);

        input.close();
    }
}