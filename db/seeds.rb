10.times do
    User.create(name: Faker::Name.name, username: Faker::Internet.username, password: "password")
end

Pc.create(cpu_brand: "Intel", cpu_model: "7700hq", ram: 16, gpu_brand: "Nvidia", gpu_model: "RTX 2060 Super", storage_type: "Solid State", storage_size: "1tb", psu: "laptop", psu_watts: "600", psu_80plus: false, user_id: 1)
Pc.create(cpu_brand: "AMD", cpu_model: "2400x", ram: 8, gpu_brand: "Nvidia", gpu_model: "RTX 3080", storage_type: "Solid State", storage_size: "1tb", psu: "laptop", psu_watts: "600", psu_80plus: false, user_id: 2)
Pc.create(cpu_brand: "AMD", cpu_model: "3600", ram: 16, gpu_brand: "AMD", gpu_model: "6700", storage_type: "Solid State", storage_size: "1 TB", psu: "laptop", psu_watts: "600", psu_80plus: true, user_id: 3)
Pc.create(cpu_brand: "Intel", cpu_model: "10900", ram: 16, gpu_brand: "Nvidia", gpu_model: "GTX 1080ti", storage_type: "Solid State", storage_size: "1tb", psu: "laptop", psu_watts: "600", psu_80plus: false, user_id: 4)
Pc.create(cpu_brand: "Intel", cpu_model: "7700hq", ram: 16, gpu_brand: "Nvidia", gpu_model: "RTX 2060 Super", storage_type: "Solid State", storage_size: "1tb", psu: "laptop", psu_watts: "600", psu_80plus: false, user_id: 5)
Pc.create(cpu_brand: "AMD", cpu_model: "2400x", ram: 8, gpu_brand: "Nvidia", gpu_model: "RTX 3080", storage_type: "Solid State", storage_size: "1tb", psu: "laptop", psu_watts: "600", psu_80plus: false, user_id: 6)
Pc.create(cpu_brand: "AMD", cpu_model: "3600", ram: 16, gpu_brand: "AMD", gpu_model: "6700", storage_type: "Solid State", storage_size: "1 TB", psu: "laptop", psu_watts: "600", psu_80plus: true, user_id: 7)
Pc.create(cpu_brand: "Intel", cpu_model: "10900", ram: 16, gpu_brand: "Nvidia", gpu_model: "GTX 1080ti", storage_type: "Solid State", storage_size: "1tb", psu: "laptop", psu_watts: "600", psu_80plus: false, user_id: 8)
Pc.create(cpu_brand: "AMD", cpu_model: "3600", ram: 16, gpu_brand: "AMD", gpu_model: "6700", storage_type: "Solid State", storage_size: "1 TB", psu: "laptop", psu_watts: "600", psu_80plus: true, user_id: 9)
Pc.create(cpu_brand: "Intel", cpu_model: "10900", ram: 16, gpu_brand: "Nvidia", gpu_model: "GTX 1080ti", storage_type: "Solid State", storage_size: "1tb", psu: "laptop", psu_watts: "600", psu_80plus: false, user_id: 10)

20.times do
    Game.create(name: Faker::Game.title, quality: "high", resolution_x: 1920, resolution_y: 1080, avg_fps: rand(24..180), pc_id: rand(1..10))
end