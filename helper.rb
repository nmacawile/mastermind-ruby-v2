class Array
  def delete_first_match!(e)
    self.delete_at(self.index(e) || self.size)
    self
  end
end