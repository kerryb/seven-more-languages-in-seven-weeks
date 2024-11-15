local Retry = {}

Retry.retry = function(count, body)
  local _succeeded, result
  local job = coroutine.create(body)

  for attempt = 1, count do
    _succeeded, result = coroutine.resume(job)
    if coroutine.status(job) == "dead" then
      return result
    end
  end

  error(result)
end

return Retry
