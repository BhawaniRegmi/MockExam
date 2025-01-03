import 'package:flutter/material.dart';



class EnrollmentForm extends StatefulWidget {
  @override
  _EnrollmentFormState createState() => _EnrollmentFormState();
}

class _EnrollmentFormState extends State<EnrollmentForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _institutionController = TextEditingController();
  final _addressController = TextEditingController();
  
  List<String> _allInstitutions = [
    'Harvard University',
    'Stanford University',
    'MIT',
    'University of Cambridge',
    'University of Oxford',
    'Caltech',
    'University of Tokyo'
  ];


  List<String> _filteredInstitutions = []; 
  String? _selectedInstitution;
  

  @override
  void initState() {
    super.initState();
    _institutionController.addListener(_filterInstitutions);
  }

   Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(icon, color: Colors.teal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validator,
    );
  }

  void _filterInstitutions() {
    final query = _institutionController.text.toLowerCase();
    if (query.isNotEmpty) {
      setState(() {
        _filteredInstitutions = _allInstitutions
            .where((institution) =>
                institution.toLowerCase().contains(query))
            .toList();
      });
    } else {
      setState(() {
        _filteredInstitutions = [];
      });
    }
  }

  void _clearSearch() {
    setState(() {
      _institutionController.clear();
      _filteredInstitutions = [];
      _selectedInstitution = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Student Enrollment Form',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
        Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
        icon: Icon(Icons.notifications, color: Colors.black),
        onPressed: () {
          // Handle notification icon press
        },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Please fill all the information below',
                  style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.teal,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
             buildTextField(
                  controller: _nameController,
                  labelText: 'Name',
                  hintText: 'Enter your full name',
                  icon: Icons.person,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    if (value.length < 3 || !RegExp(r'[a-zA-Z]').hasMatch(value)) {
                      return 'Name must be at least 3 characters long and contain at least one alphabet';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                  buildTextField(
                  controller: _mobileController,
                  labelText: 'Mobile Number',
                  hintText: 'Enter your mobile number',
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    if (!RegExp(r'^9\d{9}$').hasMatch(value)) {
                      return 'Mobile number must start with 9 and be exactly 10 digits';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                buildInstitutionField(),
                SizedBox(height: 20),
                    buildTextField(
                      controller: _addressController,
                      labelText: 'Address',
                      hintText: 'Enter your address',
                      icon: Icons.home,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                SizedBox(height: 20),
                buildTextField(
                  controller: TextEditingController(),
                  labelText: 'Email Address',
                  hintText: 'Enter your email address',
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                  },
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple, // Set the button color to deep purple
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  ),
                  onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Congratulations! Your form is submitted.'),
                      backgroundColor: Colors.teal,
                    ),
                    );
                    _formKey.currentState!.reset();
                    Navigator.pop(context);
                  }
                  },
                  child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Set the text color to white
                  ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget buildInstitutionField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _institutionController,
          decoration: InputDecoration(
            labelText: 'Institution Name',
            hintText: 'Search or select your institution',
            prefixIcon: Icon(Icons.school, color: Colors.teal),
            suffixIcon: _institutionController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.teal),
                    onPressed: _clearSearch,
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (value) {
            setState(() {});
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter or select an institution name';
            }
            return null;
          },
        ),
        if (_filteredInstitutions.isNotEmpty)
          ..._filteredInstitutions.map((institution) => ListTile(
                title: Text(institution),
                onTap: () {
                  setState(() {
                    _institutionController.text = institution;
                    _filteredInstitutions = [];
                    _selectedInstitution = institution;
                  });
                },
              )),
      ],
    );
  }
  

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _institutionController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}
