import { IsString, IsNotEmpty } from "class-validator";

export class CreateCocineroDto {
    @IsString()
    @IsNotEmpty()
    nombre:string;

    @IsString()
    @IsNotEmpty()
    sueldoBasico:number;
}
