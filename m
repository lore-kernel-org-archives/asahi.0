Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F2D7C
	for <asahi@lists.linux.dev>; Wed, 15 Feb 2023 03:17:12 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id ja21so11406697plb.13
        for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 19:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3HoOW7mnikI/W6qgH9CzqhnH7tqIVURB7YzkTuqqxeg=;
        b=yRLLo+Y2l9Rqw6rar1SCyG1SxgiM4k2LfTdR7HicsoJ3ot5+CNso463IU5kURN1h86
         nSFxSUeaFV+/D+mlWEOgnks7/Y7ZVhJVAKTYCKDTrGq9/HdNNX1yUcykVibwEyQ9jpsq
         fU2wTqpQfQzfy7JvALOZOQzvr7brLByl3XKurkcI3DHXCgcX79yvkS83ZaA37iqJpA4C
         KDea2/o8hQGM0PGNNPafiUtTbhNWi6DCUjkL8d/7qDUr80FhqUKabcI2fl9lQK7gQu4M
         02O+3gWIonFsGFOLw244Xs+ECHNZsDJtJA1ZejtNyupqPwLJb7iaz5xgprNxEmyL672c
         dJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HoOW7mnikI/W6qgH9CzqhnH7tqIVURB7YzkTuqqxeg=;
        b=RAmJkk3TJNGwjsh3oQMQ/WzB9M6JzblUoQ3AThbTvS1axm8rlTFprKI7IZeIPt1e61
         87H0TKK4EwtdUll354+5nIEEMpwGL2uMKxHJDgfMrwxRPPgN/lO5NzTp0h/8c9EJZJiF
         mlwQFQHC0VgwGTUqXR2+/O+Mj/pEZJLg3/CqZtwlXiZFr5/6I/3vICDgnZvXWEYr2Pj8
         plseLvFDWJw6tlzG5Ucbm87Vo7UGg7B7s70I6UHddsCBu8N4iJus40nf/ETTU7KILiCj
         kJ/JE5KysPB4gYWMLyEqMCvTY+VPhVNot8M516D9EfnNRwneTc2unxBkh2P2ZDVFBB3g
         /EKQ==
X-Gm-Message-State: AO0yUKXOuvBPM0GVH+um4+4jU04RyZzydXBcsug/gxQXQ042Cdnw/638
	5Txg8TkN9IWH7FmFxs9X6oOdOw==
X-Google-Smtp-Source: AK7set+1aqVANLzDp5HMuErgCQtOQR3yuVXnnsXY/YD+E/CloFSoZS7gNIcwS34GPrlK9OomuYcunQ==
X-Received: by 2002:a17:903:32c1:b0:19a:6b55:a453 with SMTP id i1-20020a17090332c100b0019a6b55a453mr1399170plr.9.1676431032105;
        Tue, 14 Feb 2023 19:17:12 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902988700b00198f2407ea1sm10792632plp.241.2023.02.14.19.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 19:17:11 -0800 (PST)
Date: Tue, 14 Feb 2023 19:17:11 -0800 (PST)
X-Google-Original-Date: Tue, 14 Feb 2023 19:17:04 PST (-0800)
Subject:     Re: [PATCH v16 0/9] RISC-V IPI Improvements
In-Reply-To: <86357k1ihd.wl-maz@kernel.org>
CC: apatel@ventanamicro.com, Paul Walmsley <paul.walmsley@sifive.com>,
  tglx@linutronix.de, daniel.lezcano@linaro.org, marcan@marcan.st, sven@svenpeter.dev,
  alyssa@rosenzweig.io, atishp@atishpatra.org, Alistair Francis <Alistair.Francis@wdc.com>,
  anup@brainfault.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  asahi@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Marc Zyngier <maz@kernel.org>
Message-ID: <mhng-a886c4b4-d748-420f-889b-76ada4f9a432@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Sun, 05 Feb 2023 03:04:14 PST (-0800), Marc Zyngier wrote:
> On Tue, 03 Jan 2023 14:12:12 +0000,
> Anup Patel <apatel@ventanamicro.com> wrote:
>>
>> This series aims to improve IPI support in Linux RISC-V in following ways:
>>  1) Treat IPIs as normal per-CPU interrupts instead of having custom RISC-V
>>     specific hooks. This also makes Linux RISC-V IPI support aligned with
>>     other architectures.
>>  2) Remote TLB flushes and icache flushes should prefer local IPIs instead
>>     of SBI calls whenever we have specialized hardware (such as RISC-V AIA
>>     IMSIC and RISC-V SWI) which allows S-mode software to directly inject
>>     IPIs without any assistance from M-mode runtime firmware.
>
> [...]
>
> I'm queuing patches 3 and 9 via the irqchip tree as they are
> standalone.
>
> For the rest, I need an Ack from the riscv maintainers as they change
> a large amount of arch-specific code, and the couple of irqchip
> patches depend on these changes.
>
> Palmer, Paul?

I haven't gotten time to give this a proper review, but I think we've 
got enough of a mess with our interrupt handling that it doesn't really 
matter so

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

if you want to take it for this cycle that's fine with me, but I'm also 
fine holding off so it can have a while to bake in linux-next -- there's 
no real rush for any of this, as there's no hardware yet.

>
> Thanks,
>
> 	M.
