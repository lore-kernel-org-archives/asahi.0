Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B92619D093
	for <asahi@lists.linux.dev>; Mon,  9 Jun 2025 14:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481107; cv=none; b=GRk8eUavG1kKCJh/AxtCiOg2DTp6+UF+ZkFjEHd6zAPEPB95Mfqlv8pfQR15SZjioFdoq93TkZDXuP7i2dyOYkEQyZ5hzwmuA6VUitiOeBYcQbmJVFzBLtgwzRR3b8S9kyiwV8saOM+MLE6T8DkNlXCRbs8KmxO5f7FMadDSHbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481107; c=relaxed/simple;
	bh=sFe+H8XLKeS7WiN2PZpSJvmWH6Jxo9uZaJQTws9Dm70=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QjpimAMa+Oq9o9SJyRe/fEa5P9OcG/hrejG0bH2FfZyaKYlxA0bFx//H2g6E9Zxg+kJ91NuudXa/RcPo+Duy1q242Pk8FxZmfurNOk5ZMBml2rMJRbTHwqoMnCiVicLlHdT5VEAY0DNy8ooVkpuZafCqGc+df9XW6QU1pk+asso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVezcp17; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVezcp17"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-742c27df0daso3860247b3a.1
        for <asahi@lists.linux.dev>; Mon, 09 Jun 2025 07:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481105; x=1750085905; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=byEYBlmbmeRBtFl6//UsijpT9TN9tT48aruahvOT2Vw=;
        b=KVezcp177JJ2uZCBS78tJXtXD92L+n8Gu9s3Sz43Htj3D1w/vai6RW9u05OKRNu/Ad
         g3BvnLg9Fy4uE5bUxln4GX2+1F4IU/1KqlJW07YLhUrXjKS+NJNuSEvAldlGDKLDy8e4
         IyTjAkzRw9/tXb5zDx7SzVdB3A5aDSBaIHJZ+6COBjrJxS/m4hpj1ZbcDq9EBM2AVStk
         /BFkk1r4U8uL3Ohn528POArKYUh5NdLyku+ykcVAauv7k9KnDIhH5Wgh/j0si5Zv4h4P
         TWKb8XcCxyzieV+e+wHgMfL7QTz1DZbOaHNjuPC42x24DfK1UuYF+lL0snMXovT/sInG
         0xfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481105; x=1750085905;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byEYBlmbmeRBtFl6//UsijpT9TN9tT48aruahvOT2Vw=;
        b=UAmHgXksVBwDmmOp8p/Dl/4eSuynQ8cK4mXuz0pSWM0SFlHICxUg0W2v2H2wmzHLj6
         ho0MUb6+omu2kGavtiQ0x9iMF7nHZkoiVdc3YEdBt4tN2RJrgTx0wHo0VVwB+lv3lSrb
         VJsncOHpyprIIb/SIEufA6SRoR35MHL2gx75VG9Y6hd9vNx1IQpDK1I/ELSWTlvVS9ND
         Dql8FN+oE7Tyj64TJ9FqwQR0223aCiyowDjWx3QSfUbFzZxyF46w5D8UB0UdS4pdAt98
         fE2z60ja9Z9SbktuuGIrqMf1EPej2dV11tsh4Mo3zn0/oecdw2w7WlhdFHY4E5kgyYXB
         E2Ug==
X-Gm-Message-State: AOJu0Yx0zlqQfTPYNJClJJ9gL0X9Sgu0Lz+8W7BpYe09yr68XEtuqyBZ
	Mqc9Mwzbf0A+MZ6sblcJyyvRuDmJ9lxzZweksjzWpnPBz6URzsTbntGmjWnWAg==
X-Gm-Gg: ASbGncsl1Rl/ARkYlr+ia5k/dcma6YE4IZjwjVF42jeR+AkGtqmwYvqa4xQ4b+IooSH
	dz/k6newk/QheNwg8FdA2kLtSGa82o8j5wWbNSTejwNs3REQ+4+PqN3iMR1MoxRw3KZVktozwwS
	7XEVfIo5XNgYFVGdJI6GPSCNv3dx7cBElxJEASCqTbWE5Hgm3DOOB3RFD6bQL1its5UtGo1bWe0
	PwpxUa66TpK55mniFNkNGrwSp4zkJxfmRYIrHwFn0C3MVmPQ9JXRfKsr3b32+YIkyLqbPdWm/Oo
	6grmOW/m3yd0mvSQulJzk6vfLWRjnX33hvM7c5GhfSnCXZvao+qykg==
X-Google-Smtp-Source: AGHT+IEIc+6G22pK0B+QVv6+YOjfM/2P7KrtVtBBawyZzoXj9zYv4yrhluVgdzNvUn9UVRzwAwkRCA==
X-Received: by 2002:a05:6300:408:b0:21f:5361:d7eb with SMTP id adf61e73a8af0-21f5361d91dmr5880509637.31.1749481105313;
        Mon, 09 Jun 2025 07:58:25 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:24 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 0/8] I2C dt nodes and bindings for Apple A7-A11 SoCs
Date: Mon, 09 Jun 2025 22:56:17 +0800
Message-Id: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABH2RmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNz3UyjZN28fN0SI12jNGNTC0tLS7MUQxMloPqCotS0zAqwWdGxtbU
 AUY5o51sAAAA=
X-Change-ID: 20250527-i2c-no-t2-2f3589996d14
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=sFe+H8XLKeS7WiN2PZpSJvmWH6Jxo9uZaJQTws9Dm70=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaIHk8b5nDOOtFNIDshX9oPFaOksqYznLjpr
 tKrwt2Q7Y6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2iAAKCRABygi3psUI
 JP+FD/9Gdgqt/lY4KDwLwOG9y0ChTcW1JV08hZC+822o6XWkd8eFThBxeujQFbiV6SqIjAzl/em
 ln75ssqyvArWQhqvpM12mKCs0hJstSCNgF75soIntCoKpg/fQiYIbDQa3pfjMO8Zf+0/dfIANHz
 p+sSJMDpF4B+6JdEtvqCsY/joLI3h/HQjPv2hTSTIPFP2uAazYGSlJR6oDejMBEUDurAq2pNNQ7
 jOF/c1JuBx1iLiCCn5ySXlVdTYtQwsmX7VEvQaiLU2fww6WVF+AzRThuz+1VAnViJynYQuKfyu8
 Ril/4WzJqQ4gZ1gCt5urjBtdyNNBphHfStaaNueW1gRTga/KZWPvvz4c1ndR/QdvHZrG02M/h6s
 9hD5oTuC3G3Ez9BzG+2AlUNdYiVViptnEyTMePGa+3qLeIbGd5i6BavX9Yvk2H8SBKggt5rbbSF
 Rr32hu21LUh/Oiwa9Y7JIT+nwzvlGI5ihTiA4FbsQtgnZgCZi65I9mnDBj8hdxxhK4IQjkagrrL
 8urBEmoWOKMB5/UvPNq2PWM1hSlflFoDAWs7EzSF50Kc9RuFWmzuWkI8sqUT8Kz56LADLuCgR4X
 i6KAIjGa5ROV6YIW8FCQSz4kNBLoP/ZVI5RwH7NnFtYgMJR5yq+HFrnLvAFNXKHqsexxgY6Q74g
 XTR6YB6U1Xieqgw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Hi,

This series adds the device tree nodes and bindings for I2C on Apple A7-A11
SoCs, since the existing driver appears to be compatible. The drivers for the
attached Dialog DA2xxx PMIC will be in a future patch series.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Nick Chan (8):
      arm64: dts: apple: s5l8960x: Add I2C nodes
      arm64: dts: apple: t7000: Add I2C nodes
      arm64: dts: apple: t7001: Add I2C nodes
      arm64: dts: apple: s800-0-3: Add I2C nodes
      arm64: dts: apple: s8001: Add I2C nodes
      arm64: dts: apple: t8010: Add I2C nodes
      arm64: dts: apple: t8011: Add I2C nodes
      arm64: dts: apple: t8015: Add I2C nodes

 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 76 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 57 +++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/s8001.dtsi    | 76 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t7000.dtsi    | 76 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t7001.dtsi    | 76 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8010.dtsi    | 76 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8011.dtsi    | 76 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi    | 76 +++++++++++++++++++++++++++++++++
 8 files changed, 589 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250527-i2c-no-t2-2f3589996d14

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

