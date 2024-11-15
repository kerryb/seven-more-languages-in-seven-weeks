local Retry = {}

Retry.retry = function(count, body)
  job = coroutine.create(body)
  succeeded, value = coroutine.resume(job)
  return value
end

return Retry
