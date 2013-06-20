require 'spec_helper'

describe Fob::Fob do

  describe '.represents' do
    let(:form) do
      Class.new(Fob::Fob) do
        represents :string, with: [:length, :chars]
      end
    end

    specify { expect(form.model_name).to eq 'String' }
    specify { expect(form.new).to respond_to(:string) }
    specify { expect(form.new).to respond_to(:string=) }
    specify { expect(form.new).to respond_to(:length) }
    specify { expect(form.new).to respond_to(:chars) }
  end

  describe '.has_one' do
    let(:form) do
      Class.new(Fob::Fob) do
        has_one :string, with: [:length, :chars]
      end
    end

    specify { expect(form.new).to respond_to(:string) }
    specify { expect(form.new).to respond_to(:string=) }
    specify { expect(form.new).to respond_to(:length) }
    specify { expect(form.new).to respond_to(:chars) }
  end

  describe '#persisted?' do
    let(:form) do
      Class.new(Fob::Fob) do
      end
    end

    specify { expect(form.new.persisted?).to eq false }
  end

end