Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D724D1591F1
	for <asahi@lists.linux.dev>; Mon, 16 Sep 2024 16:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726502422; cv=none; b=JH47RXakbdPHwMnJWEHuoMc58CJFMW2+KFt81HZsAN3UhxGlPZrojO0dvnsog3yr+120G52eIJchhS76v1SUyxFeGHxUc4EBZhmCJ7c5vfWVHRI+w50QSmQLbzHlYfx2iGZiCz2gFbHVp/UlVsRZREDZEjS91EDtb3vyh14w01g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726502422; c=relaxed/simple;
	bh=9NtX4Akc6P2gDDZtOLnCEw3gaI01Mq2PLcNOJQNeNek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kvzqCxvqx+6QrAqUYOFQ+SQWo/bAamiLtnD0oPhVk/yzRWBQBxEvdVPrHk2+5vxQFsD6EE+AWpdGZAvUzVdavb8YeL5TW5mbA0/DcrtkrN/YBPZWd/EB3+6+K+ZLRITijAZJ0H2+G2H9xhHukqd8nwKvgX8fGL/LlN1n4Gs49s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FeQxLQuc; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FeQxLQuc"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-277cfd3f07aso2433628fac.3
        for <asahi@lists.linux.dev>; Mon, 16 Sep 2024 09:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726502418; x=1727107218; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QNGAscY89spos90KeV3lVrKQOCpirqeeQdiGtvmiPzE=;
        b=FeQxLQucPdyV1Xh7jkt8+uWoF+Nrlu1ptvLvDGTnO6AJpR880RNcdqgb+TTU6yoMq6
         qKy7/Nq8IACBrk1/QYFdIzZ5dzvZQSW45Mb/R9Tf5ctQR1OEOH+gTFwspho+uVczbn6O
         6MoDohIsOBD16jpznHlkhx9CYI76mPptRzDr1KrV7Yrr4eBQcg2RnlASxUb0WX2j+llE
         pDFQfnOx6JHDh/3ooFxjVdbLmq4WGqlmDjldEp3FS1MOhyynjuMl9lBTWjHfyT7O4lRy
         Tt73CzBajGbGwha1e/xOzUzg3X9qQfMllBSoWG2tBYX1JaOwFECfAAbjI80gjE7PeG/l
         rrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726502418; x=1727107218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QNGAscY89spos90KeV3lVrKQOCpirqeeQdiGtvmiPzE=;
        b=hbfv5YL3q+YFAqfK+QSlEPskATLjkb+iTLz2CIAeKBhM72FzXWM4JElrj+57AExp8Y
         RBSiZdPkd6b4SlZydeRw4xkGKmsioqL5znFcX2oAFqs8ESkY+bD1Rl5JubOV1ymiItu1
         BqXJbnIj2MgW9htriIHQ1ZsQ3xJNbW/UkTIXsGspRgN9u4jJQJd0e6050QCkbBz3IZe2
         vPasxr2GB72ilgTIFv08aN/adhLP4lZ53SeUhTUkGAp+AcP3XRIy9qGEKcdtQsdRb/Jo
         zf5rP5ecOiaHKKbExa/dqnQeNYrg1E6wsK2fLwrRgVVVYyWxEy1YtNklu3hycnLaMjXw
         PHBw==
X-Forwarded-Encrypted: i=1; AJvYcCWnbyXS3zldUQavqs2KN5WPPPjhdirEY+9X55wl3CyvR8F2DSOm4nP300AOB2f44u62UxNOUw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx67KW5S2JtNiAmlIi3bt0xa0GRxHlOqA3nkmV5zVmaB8FLTJGU
	qTM1tHYmD7Uhuq2M8gzOs0P7X0gfN7Y/a234MVdwATDJBLb55e0v
X-Google-Smtp-Source: AGHT+IEGKIXuDbJQCCB5TuWpGJZvTObpH6f7clkm5fgDiOimQFedACIetFrXdE6vcQkAOCKT02LUSQ==
X-Received: by 2002:a05:6871:3a06:b0:260:fb01:5651 with SMTP id 586e51a60fabf-27c3f253ae6mr10872804fac.12.1726502418233;
        Mon, 16 Sep 2024 09:00:18 -0700 (PDT)
Received: from [192.168.0.101] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b97581sm3875919b3a.151.2024.09.16.09.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 09:00:17 -0700 (PDT)
Message-ID: <110df06f-a598-4ffc-97c9-372a0fb858dc@gmail.com>
Date: Tue, 17 Sep 2024 00:00:10 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: cpufeature: Pretend that Apple A10 family
 does not support 32-bit EL0
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 Marc Zyngier <maz@kernel.org>
References: <20240909091425.16258-1-towinchenmi@gmail.com>
 <20240909091425.16258-3-towinchenmi@gmail.com>
 <f908c9ca-8063-44f4-b534-ddfc067b98c2@gmail.com> <ZuhPIdnx36yXJhHi@arm.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <ZuhPIdnx36yXJhHi@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Catalin Marinas 於 2024/9/16 晚上11:30 寫道:
> On Mon, Sep 16, 2024 at 09:41:12PM +0800, Nick Chan wrote:
>> On 9/9/2024 17:10, Nick Chan wrote:
>>> The Apple A10 family consists of physical performance and efficiency
>>> cores, and only one of them can be active at a given time depending on
>>> the current p-state. However, only the performance cores can execute
>>> 32-bit EL0. This results in logical cores that can only execute 32-bit
>>> EL0 in high p-states.
>>
>> Further research shows that the MPIDR_EL1 values between the two core
>> types are different. And whether the two core type have any extra
>> differences is anyone's guess right now. So far, nothing seems to break
>> horribly without special workarounds for the MPIDR value (with cpufreq
>> enabled downstream) as:
>> 1. There are no KVM, GIC, ACPI, PSCI or cpuidle
>> 2. All CPUs switch P-mode and E-mode together
>>
>> However, all of this is broken enough that this piece of code should go
>> into arch/arm64/kernel/cpu_errata.c, and also generate a
>> TAINT_CPU_OUT_OF_SPEC for these cursed CPUs.
> 
> I wouldn't carry any additional logic in the kernel for such
> configuration (long time ago Arm had something similar, the big.LITTLE
> switcher, but the CPUs were fairly similar from a feature perspective).
This is fine from a functionality perspective, currently nothing that
accesses MPIDR after boot is used on A10(X). However, it does not sound
right either to not note that the kernel is running on a cursed CPU.

> 
>>> Trying to support 32-bit EL0 on a CPU that can only execute it in certain
>>> states is a bad idea. The A10 family only supports 16KB page size anyway
>>> so many AArch32 executables won't run anyways. Pretend that it does not
>>> support 32-bit EL0 at all.
> 
> CONFIG_COMPAT depends on ARM64_4K_PAGES || EXPERT. Do we really need
> these patches in case one enables EXPERT and tries to run 32-bit
> binaries that never ran on 16K pages before?
The worst thing that can happen is the 32-bit process crashes with illegal
instruction, the kernel will still be fine.

> 

Nick Chan

