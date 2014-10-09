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

  describe '#save' do
    let(:form) do
      Class.new(Fob::Fob) do
        attribute :property, String
      end
    end

    specify { expect { |b| form.new(property: 'foo').save(&b) }.to yield_with_args(property: 'foo') }

    it 'updates persisted?' do
      f = form.new(property: 'foo')
      expect(f).not_to be_persisted
      f.save { true }
      expect(f).to be_persisted
    end
  end

  class FailingModel
    def self.exists?(h)
      true
    end
  end

  class PassingModel
    def self.exists?(h)
      false
    end
  end

  describe 'uniqueness' do

    context 'with a failing validation' do
      let(:form) do
        Class.new(Fob::Fob) do
          def self.model_name
            ::ActiveModel::Name.new(self, nil, 'test')
          end
          attribute :property, String
          validates :property, uniqueness_on: { class_name: :failing_model }
        end
      end

      specify { expect(form.new).not_to be_valid }
    end

    context 'with a failing validation' do
      let(:form) do
        Class.new(Fob::Fob) do
          def self.model_name
            ::ActiveModel::Name.new(self, nil, 'test')
          end
          attribute :property, String
          validates :property, uniqueness_on: { class_name: :passing_model }
        end
      end

      specify { expect(form.new).to be_valid }
    end
  end

end
