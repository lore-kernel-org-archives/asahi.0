Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F021DF735
	for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 15:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066706; cv=none; b=XEkYuiBQ3eo7GSwsoz5nMUT3NzlwbK2rmi017vPRnuhLd8C+6R66vj/ziQRFrSrSYD4v2XfonQXzYlQ4xxEspGKx96IAbKurFFRByQfEmaOm3JR0FmFysjgxjBIV+UgPIuG84BHq+RPo81MtMwxsE6M8yYURdIPPvs+huaA7NBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066706; c=relaxed/simple;
	bh=oYN3yBwKAFhDDm+1KS08ubJwkHA6hRvCCNjKCImv9Lo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ni7BQpp4LPUHyOlr4PI0LUuJiBUxPTg6SYwr4LR1dVN3PwrFkOWoUeDrqShswE7EI4G687KehZkE235VR6ztM96agk3I9fJLx6YNlGszCkLYkavF1su3XihVVRyVNznuw/MaXBkvZUZgoA16L6i5K9XI4VIMW0gsftuNSOxYOnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kr1CZJcT; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kr1CZJcT"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22114b800f7so21056895ad.2
        for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 07:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740066704; x=1740671504; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NR8wjcpxYR1ODwGW2lEP9QG5C1p3MxomWI2/rfhGN4U=;
        b=Kr1CZJcTxlL+0E37SUkWZKIwo4vdDXQ9707tKI5+J5DMLzhWhSRco3ff23Sl4tVMi9
         ezZdc2mf9P3zYvD1HhDWJomB99zlvs0/6F/23LsRnG+4N+G0VMr+Kf1vvNgs3+SXFl1z
         WxDPQ3aILvCCGyryFSFlXuqT8bEEcjYpIM5rLksjIrX5PrJ5+Ylu+MkknsHHfa6DXMHG
         wzVCeOT8MLO6Bn5zQjOWAVbADjbflSOytUXBEkCD97n28SR/gOCQeRavkUQLpfSXI7GY
         nN8+F8RN0q2JN5S+cuZDL9bRIelrjGNqGr/tLeQkbuGm0O0FiMP8d2eIX+YvUD5ZdC9O
         eegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066704; x=1740671504;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NR8wjcpxYR1ODwGW2lEP9QG5C1p3MxomWI2/rfhGN4U=;
        b=rViDVK+Wm6yOrlVLsk80KRPFj61CENRUDcmooQUhsfb966UeHe81UstNdiTr3C6Wme
         VSJoYdlDHmwxc210aeoi8A+Azzot/syFEy0+eJMq0XAhtkd3ph5ZWUZcQ+uE46EIsgZj
         tlW0eiRNSQ6FqC4Hc4sduwB+pkwb4BpsWZGfxQ5l1Z9MgO0+urYUOS3s0uvaA8k0ZG4w
         C22+5+WVWCC3NIyK13iym17XszY8tbt9C1/rDXLL606fe+XAPz/dI5NM04Z2HsXUEL9C
         75qbrfkkDaOpy/KEAOsky4S+Wgn/elQP48WlHjsJ6a8F2A4Gb6/CLWfLlvuZtwj5uCoC
         8eqw==
X-Gm-Message-State: AOJu0Yy2GhWHLoJwbjfvPbAY9CwR4/SHtqTz2NX83tWJhr68LaXC+2M1
	OTkptf4ICwxUYPc71w8GMV0xaabstBfDk684/ZQVKa1nwbJz1Iys
X-Gm-Gg: ASbGncvuonJfDt3UMJJQRi9q9Ok5hJl9WdPJ0Hh8P5VQzVHXdK39fIZEsxGb3/pkQ4s
	+b+BKW6YfQBye5QHo94Ad8ZrkG6J19U+9qODzu/kWfARnTUifJ5cIhDi9uq8U8dC/zwqzP9djCx
	B1cGsVGgXnTO4K6s/Bi5YhLWV9kDJ0LKFK4mW6K1WkHepumipXtJx7Hu97su9Z54081MD8w4y+B
	kLfxqeYltvLG1EHSyHOKGlioNUkeclBQ79d+iT02BFX6HHj4buBxhq3FESTMv0ObjNPJ9Jau6qV
	7Cua8LUa8Y8MkkjnwA==
X-Google-Smtp-Source: AGHT+IEPhTJ7Bb4lHaVGDGh+KJhL7uPvRBoISpPixnwur50FdUhQQiFL6DTY+T3N+joX7r91AEIt9Q==
X-Received: by 2002:a17:902:da92:b0:221:7e36:b13e with SMTP id d9443c01a7336-2217e36e109mr106022935ad.12.1740066703713;
        Thu, 20 Feb 2025 07:51:43 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d5349019sm123694345ad.36.2025.02.20.07.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:51:43 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 0/5] arm64: dts: apple: Add DWI backlight dt nodes
Date: Thu, 20 Feb 2025 23:51:02 +0800
Message-Id: <20250220-dwi-dt-v1-0-d742431c7373@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGZPt2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMD3ZTyTN2UEt1ky2TzxDRj46QUQzMloOKCotS0zAqwQdGxtbUAUIX
 q01gAAAA=
X-Change-ID: 20250220-dwi-dt-c9c7af33bd16
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1533; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=oYN3yBwKAFhDDm+1KS08ubJwkHA6hRvCCNjKCImv9Lo=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnt0+MA7ICfOW6+7b5FNbtbwzzWetcXXX3Ugu7b
 wy4NbpzBBeJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7dPjAAKCRABygi3psUI
 JD9sD/0bhTf5uHb6Eivm89d6HiPlsmiSfNzME1MqWK/3RuukOjP0F9KRGyYTRV1X4EAjahNswEN
 eKiMl2Czugtw4m8N6udUQhbnHgeSRj5ztf6qy9aruaXVKt6WA0OTASzmzhCadhfl8E4oBWriZ8O
 oFMO0m/IHBI50Jhb8uv6EuOeng1HIBtW3oWFiKW99U5Gv6aM/WdOYkKZUUlIFmTkpHpAzBHjNIS
 7zeS5OQnB9FMzTKqt2cQobcVV3wtc1hRg2i2l/hpTJD2MN3yKg/LRo6QTwgTPD1ntqNnFK3ol7G
 SAqq6cogOhqOXl2kFRZKQsIsUuhFZ2evgLJ5JPO/dBN1Fhz4R8o2udBxGoIWV9/o2NkXuBRd78U
 kRdzsMjRrPugHF5/bVlycF74hmNfBeqGT3IDA2ApEn7PtvZ5RY6E5J83aBsEFtPQPUc0yCcE7Oi
 TpcWzEnjJ6I7K88RJS2u65z/JSxmg7HvEKU3Ik8D9stTXpFZ2J6X8Cppx5yAJA3Cyid+b4GSBny
 f+KpBpsoyUoCgMiLkU2LgNhxmVA5+H7cEdxiNC23vzDU2m3ZIYUImQKvAxNtAn3XHd5uZtDWB52
 m06nV2Nbdj4naLaUMiu6bpFG3SZ8ZYwaAy1JMFra7SbCP9kGSgM7/LfniRYNTrEz6zUmZwoWnEo
 DcZhuh9XZ43nSFg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add device tree nodes for DWI backlight found on some Apple iPhones, iPads
and iPod touches. Not all devices have this feature, as some devices
instead have their backlights directly connected to the WLED output of a
PMU or use self-emissive panels.

Devicetree bindings are in the driver series. Last version at:
https://lore.kernel.org/asahi/20250214040306.16312-1-towinchenmi@gmail.com/

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Nick Chan (5):
      arm64: dts: apple: s5l8960x: Add backlight nodes
      arm64: dts: apple: t7000: Add backlight nodes
      arm64: dts: apple: s800-0-3: Add backlight nodes
      arm64: dts: apple: t8010: Add backlight nodes
      arm64: dts: apple: t8015: Add backlight nodes

 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi     | 4 ++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi        | 7 +++++++
 arch/arm64/boot/dts/apple/s800-0-3-common.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi        | 7 +++++++
 arch/arm64/boot/dts/apple/t7000-handheld.dtsi  | 4 ++++
 arch/arm64/boot/dts/apple/t7000.dtsi           | 7 +++++++
 arch/arm64/boot/dts/apple/t8010-common.dtsi    | 4 ++++
 arch/arm64/boot/dts/apple/t8010.dtsi           | 7 +++++++
 arch/arm64/boot/dts/apple/t8015-8.dtsi         | 4 ++++
 arch/arm64/boot/dts/apple/t8015.dtsi           | 7 +++++++
 10 files changed, 55 insertions(+)
---
base-commit: 3febe9de5ca5267618675650871a626d0901f8cb
change-id: 20250220-dwi-dt-c9c7af33bd16

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

