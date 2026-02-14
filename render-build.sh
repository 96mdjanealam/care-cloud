#!/usr/bin/env bash
set -o errexit

# Install dependencies, including Prisma CLI
npm install

# Run the postinstall script explicitly to ensure Prisma Client is generated.
# Even if npm install triggers it, running it again guarantees it happens in the correct environment context.
npm run db:generate

# Run TypeScript compilation
npm run build

# Corrected Prisma migration command.
# Remember: Consider moving this to a Post-deployment script if possible.
npx prisma migrate deploy --schema=./prisma/schema

# Optional: Remove the incorrect command
# npx prisma migrate # <-- This line should NOT be present