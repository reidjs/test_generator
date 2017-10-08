def permute(arr)
  return arr if arr.length < 2
  perms = []
  i = 0
  while i < arr.length - 1
    j = i + 1
    while j < arr.length
      perm = permute(arr[i .. j])
      p perm
      perms << perm
      j += 1
    end
    i += 1
  end
  perms
end
p permute([1,2,3])
