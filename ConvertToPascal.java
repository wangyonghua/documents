import java.util.ArrayList;
import java.util.List;

public class ConvertToPascal {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String[] ss = new String[] { "additional_charge_flat", "cancel_rule_flat", "guide_inventory_flat",
				"guide_markup_rule_flat", "guide_price_flat", "guide_price_rule_flat", "overbooking_flat",
				"sale_base_price_rule_flat", "sale_price_rule_flat", "sepcial_price_rule_flat",
				"supplier_car_inventory_modification_flat", "supplier_car_markup_rule_flat",
				"supplier_car_price_flat" };

		List<String> ssa = new ArrayList<>();

		for (int i = 0; i < ss.length; i++) {

			String[] s = ss[i].split("_");

			String result = "";

			for (int j = 0; j < s.length; j++) {
				result += s[j].substring(0, 1).toUpperCase();
				result += s[j].substring(1);

			}
			if (result.endsWith("ies")) {
				result = result.substring(0, result.length() - 3) + "y";
			}
			if (result.endsWith("s"))
				result = result.substring(0, result.length() - 1);

			ssa.add("Db" + result);
		}

		System.out.println(ssa.size());
		ssa.forEach(s -> System.out.println(s));

	}

}
