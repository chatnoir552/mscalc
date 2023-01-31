class Status < ApplicationRecord
    validates :main, {presence: true, length: {maximum: 15}, numericality: {only_integer: true} }
    validates :mh_main, {presence: true, length: {maximum: 15}, numericality: {only_integer: true} }
    validates :ap_main, {presence: true, length: {maximum: 15}, numericality: {only_integer: true} }
    validates :arc_main, {presence: true, length: {maximum: 15}, numericality: {only_integer: true} }
    validates :aut_main, {presence: true, length: {maximum: 15}, numericality: {only_integer: true} }
    validates :hyper_main, {presence: true, length: {maximum: 15}, numericality: {only_integer: true} }
    validates :inner_main, {presence: true, length: {maximum: 15}, numericality: {only_integer: true} }
    validates :union_main, {presence: true, length: {maximum: 15}, numericality: {only_integer: true} }
    validates :status, {presence: true, length: {maximum: 15}, numericality: {only_integer: true} }
    validates :sub, {presence: true, length: {maximum: 15}, numericality: {only_integer: true} }
    validates :dame, {presence: true, length: {maximum: 15}, numericality: {only_integer: true} }
    validates :final_dame, {presence: true, length: {maximum: 15}, numericality: {only_integer: true} }
    validates :wepon, {presence: true, length: {maximum: 15}}
    validates :wepon_main_per, {presence: true, length: {maximum: 15}, numericality: {only_integer: true} }
    validates :wepon_add_per, {presence: true, length: {maximum: 15}, numericality: {only_integer: true} }
    validates :addwepon_main_per, {presence: true, length: {maximum: 15}, numericality: {only_integer: true} }
    validates :addwepon_add_per, {presence: true, length: {maximum: 15}, numericality: {only_integer: true} }
    validates :em_main_per, {presence: true, length: {maximum: 15}, numericality: {only_integer: true} }
    validates :em_add_per, {presence: true, length: {maximum: 15}, numericality: {only_integer: true} }
    validates :fb, {presence: true, length: {maximum: 15}, numericality: {only_integer: true} }
    validates :union_sub, {presence: true, length: {maximum: 15}, numericality: {only_integer: true} }

end
