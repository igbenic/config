local webhookBase = "http://homeserver.local:63743/?id=5c6e6743-b493-4aa0-84dd-4b4821f1c067&command=On&value="
local lastValue = nil
local lastSentAt = 0
local minIntervalSeconds = 0.0

local function sendState(value, label)
    local t = hs.timer.secondsSinceEpoch()

    if lastValue == value and (t - lastSentAt) < minIntervalSeconds then
        hs.printf("Skipping duplicate %s webhook", label)
        return
    end

    hs.http.asyncGet(webhookBase .. value, nil, function(status, body, headers)
        if status == 200 then
            lastValue = value
            lastSentAt = t
            hs.printf("%s webhook OK", label)
        else
            hs.printf("%s webhook FAIL status=%s body=%s", label, tostring(status), tostring(body))
        end
    end)
end

local function handleCaffeinateEvent(event)
    if event == hs.caffeinate.watcher.screensDidUnlock then
        sendState("true", "Unlock")
    elseif event == hs.caffeinate.watcher.screensDidLock then
        sendState("false", "Lock")
    end
end

macLockWatcher = hs.caffeinate.watcher.new(handleCaffeinateEvent)
macLockWatcher:start()

hs.printf("Mac lock/unlock watcher loaded")