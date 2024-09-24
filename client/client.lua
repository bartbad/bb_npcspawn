Citizen.CreateThread(function()
    -- Zmniejszenie spawnu pojazdów NPC
    SetVehicleDensityMultiplierThisFrame(0.2)  -- 0.0 = brak pojazdów, 1.0 = standardowa ilość
    SetRandomVehicleDensityMultiplierThisFrame(0.2) -- Ilość losowych pojazdów
    SetParkedVehicleDensityMultiplierThisFrame(0.1) -- Ilość zaparkowanych pojazdów
    SetPedDensityMultiplierThisFrame(0.3)  -- Ilość pieszych NPC
    SetScenarioPedDensityMultiplierThisFrame(0.1, 0.1) -- GIlość NPC w scenariuszach (np. pracownicy, turyści)

    -- Ustawienia spawnowania pociągów i samolotów
    SetGarbageTrucks(false) -- Wyłączenie śmieciarek
    SetRandomBoats(false) -- Wyłączenie losowych łodzi
    SetCreateRandomCops(false) -- Wyłączenie losowych policjantów
    EnableDispatchService(1, false) -- Wyłączenie policji
    EnableDispatchService(2, false) -- Wyłączenie straży pożarnej
    EnableDispatchService(3, false) -- Wyłączenie ambulansów

    -- Pętla do ciągłego ustawiania wartości
    while true do
        Citizen.Wait(0)

        -- Resetowanie wartości co klatkę (ważne, aby zmiany były trwałe)
        SetVehicleDensityMultiplierThisFrame(0.2)
        SetRandomVehicleDensityMultiplierThisFrame(0.2)
        SetParkedVehicleDensityMultiplierThisFrame(0.1)
        SetPedDensityMultiplierThisFrame(0.3)
        SetScenarioPedDensityMultiplierThisFrame(0.1, 0.1)

        -- Wyłączenie służb ratunkowych i policji
        DisableDispatchServices()
    end
end)

function DisableDispatchServices()
    -- Wyłączanie wszystkich możliwych służb ratunkowych
    for i = 1, 12 do
        EnableDispatchService(i, false)
    end
end
