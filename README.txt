SPI UVM Verification IP 
========================

Bu proje, UVM (Universal Verification Methodology) standardında geliştirilmiş, endüstri seviyesinde SPI Verification IP (VIP) içeren eksiksiz bir doğrulama ortamı sağlar.

----------------------------
Klasör Yapısı
----------------------------

spi_vip/
├── rtl/
│   └── spi_if.sv
├── spi_agent/
│   ├── spi_pkg.sv
│   ├── spi_transaction.sv
│   ├── spi_sequence.sv
│   ├── spi_sequencer.sv
│   ├── spi_driver.sv
│   ├── spi_monitor.sv
│   └── spi_agent.sv
├── spi_env/
│   ├── spi_scoreboard.sv
│   ├── spi_env.sv
│   └── spi_test.sv
└── tb/
    └── tb_spi_top.sv

----------------------------
Proje Bileşenleri
----------------------------

- rtl/spi_if.sv:
  SPI bus interface’i.

- spi_agent/:
  Agent bileşenleri (driver, monitor, sequencer, transaction, sequence).

- spi_env/:
  - spi_scoreboard.sv: Monitor’dan gelen transaction’ları kontrol eden scoreboard.
  - spi_env.sv: Agent ve scoreboard’u birleştiren environment.
  - spi_test.sv: Environment’ı kurar ve SPI senaryolarını çalıştırır.

- spi_agent/spi_pkg.sv:
  Tüm VIP bileşenlerini bir arada tutan package.

- tb/tb_spi_top.sv:
  Top-level testbench; run_test("spi_test") çağırır.

----------------------------
Gerekli Yazılımlar
----------------------------

- ModelSim / Questa veya UVM destekli başka bir SystemVerilog simülatörü
- UVM 1.2 kütüphanesi (ModelSim’le birlikte gelir)
- Terminal veya komut satırı

----------------------------
Derleme ve Simülasyon Adımları (ModelSim)
----------------------------

Proje dizinine gidin ve aşağıdaki komutları sırasıyla çalıştırın:

1) Çalışma kütüphanesi oluştur:
   vlib work
   vmap work work

2) SPI interface derle:
   vlog rtl/spi_if.sv

3) VIP paketini derle (tüm agent, env ve test dosyalarını içerir):
   vlog spi_agent/spi_pkg.sv

4) Top-level testbench’i derle:
   vlog tb/tb_spi_top.sv

5) Simülasyonu başlat:
   vsim tb_spi_top

6) (Opsiyonel) Tüm sinyalleri waveform'a ekle:
   add wave -r *

7) Simülasyonu çalıştır:
   run -all

----------------------------
Simülasyonda Beklenen Çıktılar
----------------------------

- Driver tarafından gönderilen ve monitor tarafından yakalanan SPI transaction’ları UVM loglarında görünür.
- Scoreboard, monitor’dan aldığı transaction’ları kontrol eder ve log yazar.

Örnek UVM log çıktısı:
  UVM_INFO spi_monitor.sv(35) @ time: ...: Monitor captured: tx_data=0xA5 rx_data=0x00
  UVM_INFO spi_scoreboard.sv(20) @ time: ...: [Scoreboard] Transaction checked: tx_data=0xA5 rx_data=0x00

----------------------------
Tamamlanan UVM Mimarisi
----------------------------

- Agent: SPI sinyallerini süren driver, SPI hattını dinleyen monitor ve sequencer.
- Environment: Agent ve scoreboard’u içerir.
- Test: Environment’ı kurar ve SPI sequence başlatır.
- Top-level Testbench: run_test("spi_test") ile tüm UVM akışını başlatır.

----------------------------
Geliştirme Önerileri
----------------------------

- Coverage ekleyebilirsiniz.
- Farklı SPI senaryoları için sequence sınıfını geliştirebilirsiniz.
- UVM config_db kullanarak SPI parametrelerini konfigüre edebilirsiniz.
- Driver ve monitor’a SPI MODE0/MODE3 gibi destek ekleyebilirsiniz.

----------------------------
Sonuç
----------------------------