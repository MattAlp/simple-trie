class Trie
  alias RecursiveHash = Hash(Iterable, RecursiveHash) | Nil

  def initialize
    @root = Hash(String, RecursiveHash).new
  end

  def insert(collection : Iterable)
    current = @root
    collection.each do |token|
      x = current.fetch(token, nil)
      if x.nil?
        current[token] = Hash(Iterable, RecursiveHash).new
        current = current[token]
      else
        current = x
      end
    end
  end

  def contains?(collection : Iterable) : Bool
    current = @root
    collection.each do |token|
      if current.nil?
        return false
      end
      current = current.fetch(token, nil)
    end
    return true
  end
end
