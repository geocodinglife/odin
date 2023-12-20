module RoomsHelper
  def generate_wompi_signature(reference, amount, currency, wompi_integrity)
    Digest::SHA2.hexdigest(reference + amount + currency + wompi_integrity)
  end
end
