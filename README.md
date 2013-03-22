FieldableForm [![Build Status](https://travis-ci.org/rbao/fieldable_form.png)](https://travis-ci.org/rbao/fieldable_form) [![Code Climate](https://codeclimate.com/github/rbao/fieldable_form.png)](https://codeclimate.com/github/rbao/fieldable_form)
==============
FieldableForm is intended to make building an end user facing form builder easier. It provides all the field models necessary for building such functionality and also some erb and js templates for bootstraping the views. Checkout the [Example App](https://github.com/rbao/fieldable_form_example_app "Example App") to see how it work in action.

Installation
-------------
FieldableForm is only compatiable with Rails 3+.

    gem 'fieldable_form'

Getting Started
----------
To use FieldableForm, you will need to implement the following two types of models. 

### Form Model
FieldableForm provide an easy way for you to build form models that can have different type of fields.
    
    class ProductForm < ActiveRecord::Base
      attr_accessible :fields_attributes
    
      has_many :fields, :class_name => FieldableForm::Field, :as => :fieldable, :dependent => :destroy
      accepts_nested_attributes_for :fields, :allow_destroy => true
    end

The `FieldableForm::Field` provided by FieldableForm is the parent of all other fields, by having a has_many association with it, the form model can have any types of fields and it handles all the STI headaches. You can also implement your own field by inheriting from `FieldableForm::Field` as long as you implement the mandatory methods, you can check the source of `FieldableForm::Field` for those methods.

### Entry Model
The entry model is the model that will hold the values of the fields that user entered through the form. It needs to have an attribute which can holds the field name and value pairs as an hash.

    class Product < ActiveRecord::Base
      attr_accessible :product_form_id, :properties
      belongs_to :product_form
      
      # provides validations for the the entry against the form model
      include FieldableForm::EntryValidations
      validate_fieldable_form_entry :product_form, :properties
      
      serialize :properties, Hash
    end

Then in the views you can use `OpenStruct` to render the fields from the `product_form` and its corresponding values.
    
    <%= f.fields_for :properties, OpenStruct.new(@product.properties) do |ff| %>
      <% @product.product_form.fields.each do |field| %>
        <%= render  "product_forms/entry/field", f: ff, field: field %>
      <% end %>
    <% end %>

For more detailed implementation please take a look at the [Example App](https://github.com/rbao/fieldable_form_example_app "Example App")

Bootstrap Views
----------------
FieldableForm does not provide any views by default, However you could get a default views and some useful helpers as a starting point.

    rails g fieldable_form:bootstrap [underscored_form_model_name]

Example App
----------
[Example App](https://github.com/rbao/fieldable_form_example_app "Example App")
