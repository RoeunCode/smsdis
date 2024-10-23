<?php

namespace App\Imports;

use App\tbl_import;
use Maatwebsite\Excel\Concerns\ToModel;
use Illuminate\Validation\Rule;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithValidation;

class UsersImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        if(!tbl_import::where('en_name','LIKE','%'.$row[2].'%')->exists()) {
            return new tbl_import([
//                'student_id'=>$row[0],
//                'kh_name'=>$row[1],
//                'sex'=>$row[2],
//                'dob'=>\PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($row[3]),
//                'N'=>$row[4],
//                'telephone'=>$row[5],
                    'student_id'=>$row[0],'kh_name'=>$row[1],'en_name'=>$row[2],'sex'=>$row[3],
                    'dob'=>\PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($row[4]),
                    'phone_student'=>"0".$row[5],
                    'national'=>$row[6],'village_pob'=>$row[7],'commue_pob'=>$row[8],'district_pob'=>$row[9],
                    'province_pob'=>$row[10],'village_current'=>$row[11],'commue_current'=>$row[12],
                    'district_current'=>$row[13],
                    'province_current'=>$row[14],'old_grade'=>$row[15],'old_school'=>$row[16],'old_en_grade'=>$row[17],
                    'farther_name'=>$row[18],'mother_name'=>$row[19],'farther_job'=>$row[20],
                    'mother_job'=>$row[21],'national_far'=>$row[22],'national_mother'=>$row[23],
                    'phone_farther'=>$row[24],'address_farther'=>$row[25],'address_mother'=>$row[26],
                    'deleted'=>$row[27],'campus_id'=>$row[28]
                ]
            );
        }
//        dd(\PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($row[4]));
        //Undefind offset beacuase in your file excel have 3 sheet we need to delete sheet save only 1 sheet
    }


}
