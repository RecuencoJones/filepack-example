import { NestFactory } from '@nestjs/core';
import { config } from '@app/config';
import { AppModule } from './app.module';

console.log(config);

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  await app.listen(3000);
}

bootstrap();
