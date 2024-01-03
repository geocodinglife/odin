module RoomsHelper
  require "digest"

  def generate_wompi_signature(reference, amount, currency, wompi_integrity)
    original_data = "3b4393bafed398ba1"
    new_reference = original_data.chars.shuffle.join  + reference
    Digest::SHA2.hexdigest(new_reference + amount + currency + wompi_integrity)
  end
end
