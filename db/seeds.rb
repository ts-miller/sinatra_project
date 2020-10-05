User.create(name: Faker::Name.first_name, username: Faker::Name.last_name, password: "password1")
User.create(name: Faker::Name.first_name, username: Faker::Name.last_name, password: "password2")
User.create(name: Faker::Name.first_name, username: Faker::Name.last_name, password: "password3")
User.create(name: Faker::Name.first_name, username: Faker::Name.last_name, password: "password4")

Pc.create(cpu_brand: "Intel", cpu_model: "7700hq", ram: 16, gpu_brand: "nvidia", gpu_model: "gtx1060", storage_type: "Solid State", storage_size: "1tb", psu: "laptop", psu_watts: "600", psu_80plus: false, user_id: 1)
Pc.create(cpu_brand: "AMD", cpu_model: "2400x", ram: 8, gpu_brand: "nvidia", gpu_model: "gtx1060", storage_type: "Solid State", storage_size: "1tb", psu: "laptop", psu_watts: "600", psu_80plus: false, user_id: 2)
Pc.create(cpu_brand: "AMD", cpu_model: "3600", ram: 16, gpu_brand: "AMD", gpu_model: "6700", storage_type: "Solid State", storage_size: "1tb", psu: "laptop", psu_watts: "600", psu_80plus: true, user_id: 3)
Pc.create(cpu_brand: "Intel", cpu_model: "10900", ram: 16, gpu_brand: "nvidia", gpu_model: "gtx1060", storage_type: "Solid State", storage_size: "1tb", psu: "laptop", psu_watts: "600", psu_80plus: false, user_id: 4)

Game.create(name: "Shadow of the tomb Raider", quality: "high", resolution_x: 1920, resolution_y: 1080, avg_fps: 83, pc_id: 3)
