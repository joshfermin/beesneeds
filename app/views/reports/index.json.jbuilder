json.array!(@reports) do |report|
  json.extract! report, :activity, :block_id, :comment, :date, :image, :plug_state, :plug_type, :pluga, :plugn
  json.url report_url(report, format: :json)
end
