json.array!(@blocks) do |block|
  json.extract! block, :block_number, :user_id
  json.url block_url(block, format: :json)
end
