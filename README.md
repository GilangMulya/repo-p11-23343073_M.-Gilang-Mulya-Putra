# repo-p11-23343073_M.-Gilang-Mulya-Putra

# 📦 Tugas P11 - Implementasi Repository Pattern

## 1. Alasan Pemilihan Repository Pattern
Repository Pattern bertindak sebagai *Single Source of Truth* (sumber kebenaran tunggal) dalam manajemen data aplikasi. Arsitektur ini dipilih dengan alasan strategis berikut:
* **Decoupling (Pemisahan Logika):** Lapisan antarmuka (UI/BLoC) tidak perlu tahu apakah data berasal dari server (API) atau *cache* lokal. UI hanya menerima hasil akhir yang sudah matang.
* **Maintainability:** Mempermudah pemeliharaan jangka panjang. Jika suatu saat *library* HTTP (`Dio`) diganti, atau *database* lokal diubah, logika bisnis utama tidak akan terdampak sama sekali.
* **Offline-First Capability:** Memudahkan pembuatan logika *fallback*, di mana aplikasi akan secara otomatis mengambil data dari basis data lokal jika deteksi koneksi internet (API) gagal atau *timeout*.

## 2. Diagram Interaksi Komponen

```text
[ Antarmuka (UI/BLoC) ]
          │ (Meminta Data)
          ▼
[ Repository Implementation ] ──> (Memutuskan sumber data: API vs Cache)
          │
          ├───> [ Remote Data Source ] ──> (Dio + Auth Interceptor) ──> [ REST API Server ]
          │
          └───> [ Local Data Source ] ──> (Local Storage/Cache) ──> [ Perangkat Pengguna ]
