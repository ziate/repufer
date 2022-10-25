<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Cart;
use App\Models\Food;
use Illuminate\Http\Request;
use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class CartController extends Controller
{
    public function index(Request $request, $id)
    {
        $cart = Cart::where(['restaurant_id' => $id, 'user_id' => auth()->id()])->get();
        $data = [];
        foreach($cart as $val){
            $product = Food::find($val->food_id);
            $data[] = [
                'cart_id' => $val->id,
                'food_id' => $val->food_id,
                'quantity' => $val->quantity,
                'price' => $val->price,
                'restaurant_id' => $val->restaurant_id,
                'name' => $product->name,
                'image' => asset('storage/app/public/product/'.$product['image']),
            ];
        }

        return response()->json(['data' => $data], 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'restaurant_id' => 'required|numeric',
            'food_id' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $product = Food::find($request->food_id);

        Cart::create([
            'user_id' => auth()->id(),
            'food_id' => $request->food_id,
            'quantity' => isset($request->quantity) ? $request->quantity : 1,
            'price' => $product->price,
            'restaurant_id' => $request->restaurant_id,
        ]);

        return response()->json(['message' => trans('messages.added to cart successfully')], 200);
    }

    public function update(Request $request, $id)
    {
        $is_increase = (isset($request->is_increase) && $request->is_increase == true) ? true : false;
        $cart = Cart::find($id);
        $product = Food::find($cart->food_id);

        $cart->update([
            'quantity' => isset($request->quantity) ? $request->quantity : ($is_increase ? $cart->quantity + 1 : $cart->quantity - 1),
        ]);

        return response()->json(['message' => trans('messages.cart updated successfully')], 200);
    }

    public function delete($id)
    {
        $cart = Cart::find($id);
        $cart->delete();

        return response()->json(['message' => trans('messages.cart deleted successfully')], 200);
    }
}
