class my_transaction extends uvm_sequence_item;
  rand bit [7:0] addr;
  rand bit [7:0] data;

  // Factory registration and print support
  //`uvm_object_utils(my_transaction)

  // Constructor
  function new(string name = "my_transaction");
    super.new(name);
  endfunction

  // Constraint example (optional)
  constraint c_addr_range_ {addr inside {[8'h00 : 8'hFF]};}
  constraint c_data_range_ {data inside {[8'h00 : 8'hFF]};}

  // Custom print (optional)
  function void do_print(uvm_printer printer);
    super.do_print(printer);
    printer.print_field_int("addr", addr, $bits(addr), UVM_HEX);
    printer.print_field_int("data", data, $bits(data), UVM_HEX);
  endfunction

  // Optional: deep copy
  function void do_copy(uvm_object rhs);
    my_transaction rhs_;
    if (!$cast(rhs_, rhs)) begin
      `uvm_fatal("COPY_FAIL", "Cast failed in do_copy()");
    end
    super.do_copy(rhs);
    addr = rhs_.addr;
    data = rhs_.data;
  endfunction

  // Optional: equality compare
  function bit do_compare(uvm_object rhs, uvm_comparer comparer);
    my_transaction rhs_;
    if (!$cast(rhs_, rhs)) begin
      `uvm_fatal("COMPARE_FAIL", "Cast failed in do_compare()");
    end
    return super.do_compare(rhs, comparer) && (addr == rhs_.addr) && (data == rhs_.data);
  endfunction
endclass

