## <u>Variables In Terraform</u>

<br/><br/>
<p>
    <li>In Terraform, variables are a way to <b style="color:skyblue">parameterize your configurations</b>, making your code flexible and reusable.</li>
    <li>Variables allow you to define and manage dynamic values that can change depending on the environment or specific use cases.</li>

```terraform
# Variable Declaration in ec2-variable.tf file.    

variable "ec2-ami-id" {
  default = "ami-04f8d7ed2f1a54b14"
}

variable "instance_count" {
  type        = number
  description = "The number of instances to create"
  default     = 1
}

variable "tags" {
  type = map(string)
  description = "A map of tags to apply to the resources"
  default = {
    "Environment" = "dev"
    "Project"     = "my-project"
  }
}

variable "instance_type" {
  type        = string
  description = "Which type of Instance we are going to use"
  default     = "t2.micro"
}
```

```terraform
# Using variables declared in ec2-variable.tf 

resource "aws-instance" "ec2-demo" {
  ami           = var.ec2-ami-id
  count         = var.instance_count
  tags          = var.tags
  instance_type = var.instance_type
}
```

</p>

#### <u>Type of Variables in Terraform</u>

<p>There are several types of variable in Terraform:</p>

<table>
<tr>
<th>Data Type</th>
<th>Description</th>
<th>Examples</th>
</tr>
<tr>
<td>string</td>
<td>A string variable holds a sequence of characters.</td>
<td>

    variable "example_string" {
      type        = string
      description = "A string variable"
      default     = "default_value"
    }

</td>
</tr>
<tr>
<td>number</td>
<td>A number variable holds a numeric value.</td>
<td>

	variable "example_number" {
	  type        = number
	  description = "A number variable"
	  default     = 10
	}
</td>
</tr>
<tr>
<td>bool</td>
<td>A boolean variable holds either true or false.</td>
<td>

	variable "example_bool" {
	  type        = bool
	  description = "A boolean variable"
	  default     = true
	}
</td>
</tr>
<tr>
<td>list</td>
<td>A list variable holds an ordered sequence of values, all the same type.</td>
<td>

	variable "example_list" {
	  type        = list(string)
	  description = "A list of strings"
	  default     = ["value1", "value2", "value3"]
	}
</td>
</tr>
<tr>
<td>set</td>
<td>A set variable holds an unordered collection of unique values, all the same type.</td>
<td>

	variable "example_set" {
	  type        = set(string)
	  description = "A set of strings"
	  default     = ["value1", "value2", "value3"]
	}
</td>
</tr>
<tr>
<td>map</td>
<td>A map variable holds a collection of key-value pairs, where all keys are strings, and all values are of the same type.</td>
<td>
	
	variable "example_map" {
	  type        = map(string)
	  description = "A map of string keys to string values"
	  default     = {
		key1 = "value1"
		key2 = "value2"
	  }
	}

</td>
</tr>
<tr>
<td>object</td>
<td>An object variable holds a collection of named attributes that each have their own type.</td>
<td>

	variable "example_object" {
	  type = object({
	    name = string
	    age  = number
	    is_admin = bool
	  })
	  description = "An object with multiple attributes"
	  default = {
	    name = "John Doe"
		age  = 30
		is_admin = false
	  }
	}
</td>
</tr>
<tr>
<td>tuple</td>
<td>A tuple variable holds a sequence of elements, which can be of different types.</td>
<td>

	variable "example_tuple" {
	  type = tuple([string, number, bool])
	  description = "A tuple with a string, a number, and a boolean"
	  default = ["example", 42, true]
	}
</td>
</tr>
</table>
