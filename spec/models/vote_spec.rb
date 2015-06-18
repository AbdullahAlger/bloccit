describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        vote_one = Vote.new(value: 1)
        vote_two = Vote.new(value: -1)
        false_vote = Vote.new(value: 2)

        expect(vote_one.valid?).to eq(true)
        expect(vote_two.valid?).to eq(true)
        expect(false_vote.valid?).to eq(false)
      end
    end
  end
end