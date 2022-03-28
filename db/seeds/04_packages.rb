Package.create(name: 'Free', description: 'A free Package to get your work seen and sell your work', enable: true, price: 0, duration_type: :daily, duration_span: 10, trial: true)

Package.create(name: 'Starter', description: 'A beginner Package to get your work seen and sell your work', enable: true, price: 8, duration_type: :monthly, duration_span: 1)
Package.create(name: 'Plus', description: 'A advance Package to get your work seen and sell your work', enable: true, price: 15, duration_type: :monthly, duration_span: 1)
Package.create(name: 'Pro', description: 'A premium Package to get your work seen and sell your work', enable: true, price: 25, duration_type: :monthly, duration_span: 1)

Package.create(name: 'Starter', description: 'A beginner Package to get your work seen and sell your work', enable: true, price: 80, duration_type: :yearly, duration_span: 1)
Package.create(name: 'Plus', description: 'A advance Package to get your work seen and sell your work', enable: true, price: 150, duration_type: :yearly, duration_span: 1)
Package.create(name: 'Pro', description: 'A premium Package to get your work seen and sell your work', enable: true, price: 250, duration_type: :yearly, duration_span: 1)