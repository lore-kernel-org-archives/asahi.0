Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E94522687C
	for <asahi@lists.linux.dev>; Mon,  7 Apr 2025 04:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744001213; cv=none; b=mEazlvmmLN+cW/EdRjsCz3vsOya28CLjDVJa+eUoRAun/uUPpm3RkOX5N4uFxgQDXquGDun/7BMv18N+mUawROWjNrTgNquexGHwx/5L+W3r6jfHsmMdmbxbNkAdTnNBJBVMflmLanDHh0iK7onjFAh2Ui4vHbCY8IzdfwTok90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744001213; c=relaxed/simple;
	bh=gOE3a46CDNX3yVDAoVpyrWK4j8QsbYn+HXz/rfkRHIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YWTkPMb8X5415MVqq5kBl+mblHklRkZUCf8p7bep338MUbEWT62vFKuEsTWelpi83tNRp4JKxGHI3Zqix2s4TjoIL5R292bWkZ7Oi8vlISKZvuZYg69mnTN8humB6bBOE7z5ThBnpHKqpmJ9WNXwP4n9Cb0iZHK3Hgo3pzAojhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bn7Mg3Nd; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bn7Mg3Nd"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so3165305b3a.0
        for <asahi@lists.linux.dev>; Sun, 06 Apr 2025 21:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001211; x=1744606011; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bV39ciPbYxAqyF9bw5GexYzHMHyeT7cFiiGjkDg4x0=;
        b=bn7Mg3NdXWtt0sVm2K5wsZfqqQceieghqIECmZFaEj9gI/n/diy7nQkJrLaey/10OB
         8BRRFWB7+5KrPv/kxv64jsmei5FAjivqGnGKunKhUzE2vHFWAUBYoI61ik1mDODmsp1C
         YJcZwEzJaoz9pGnqBzZmADWT/16SPK3ZYEc3M2WvtaFSAZ0N6CSP/g7lAe6YAeUqXCrM
         sturxrFfkJliV9NsYSq6MHhygFyfo2e0D5fVFvVYjP0Shr+RdOebwJ+2aMbjW2DW+DJG
         E6+eq3BLPRItZCF5Wk4BfpObSNROJMtpVe+rdbdqic925oj9Bi5wqj8ZdK7tljs6vV2L
         fywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001211; x=1744606011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bV39ciPbYxAqyF9bw5GexYzHMHyeT7cFiiGjkDg4x0=;
        b=nDLHfLvnZ64JqY+t2kaPvu7zRjF8g4pXamcz5QlnDeI3VJ6mJSVejMNaIRPzq3k25d
         apvz1Jd0sCm/RZHILA3jjGSzDnM+RihzmXZZdckVlOJmV9RNdHJ40ggZy3ITdjMrNRy+
         rxO4gAXQqG1Xei6CV6dbLWDfEEe6bCRbHqIE8sJcky3r66Y0m4C22agttrhvHmh2mRkt
         7Fh7Fr8fUdopDLJvCD9wU3o8Q4kITXBvvrofbKGkL12W2cPIwOXJPFQDMBsqQlJqkV9F
         CHrFlScw3xNBShgmswNIyMEB7zA+MdgXOEDDpTDLVT3e7W/4aNZ+qo0yBIE6Afu/Plcj
         pzOg==
X-Forwarded-Encrypted: i=1; AJvYcCXODHMZags4nW0nh1OGpIlW2gjqX7onuV6SmWV/ScFb1rtsKiPV4e97+lkxhAk+AsLrcnjGIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnM4jN61KZMJAZ3SZXAPmgR6W7W9uf5/WNNSeHLC0f1dHAhbDy
	S/mLwZLDzfmvu3fq+x21VZ37ZMVndd7vLIxRyPNMkaKx836FczRV
X-Gm-Gg: ASbGncsw2BUzPwoEGbR4WBGllxjfqCQM20+tfPtAmvx8QxRGnVef2vV0akaeweqnHIm
	96JE8LRBn5oRI1Xadiv7qpRwgLd28tEUaqGFAesZksOlzY5Lk1+ISw6p/yNVeyNGqDeGFGz6n7H
	N8XY7Ui3kTWZclJj0OBRdBvJ22qoTz4XxVXZKWwLkBlqnwgvMOqS8k47aEAw4+2Y0cTlQ6ROvW8
	tGpP/aw1UTlwEythA0DrUdBx5lKYQ3jKaKHc9MLENvSc9QHDEgRFMMcSJZNO/fQJJnH+jGn+DM0
	Z0x/Mx+Fay+kQHUDfql4k0dihcopj5xkR4w4+bEaOy7B0Sw=
X-Google-Smtp-Source: AGHT+IHmg+dGZ5ffm359pcdGaL9W/XS2EUKol6XAMPziDAzw3x2N9fr/np18kiZDHh0QZ5bpJTIjHA==
X-Received: by 2002:a17:90b:5202:b0:2fe:93be:7c9d with SMTP id 98e67ed59e1d1-306a4e72bb7mr16105136a91.7.1744001210730;
        Sun, 06 Apr 2025 21:46:50 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:50 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:23 +0800
Subject: [PATCH v6 14/21] arm64: dts: apple: t7000: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-14-ae8c2f225c1f@gmail.com>
References: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
In-Reply-To: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=gOE3a46CDNX3yVDAoVpyrWK4j8QsbYn+HXz/rfkRHIk=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iH3+YmlrIk6rELKJ921/3DC4VYqrmOTFL5Z
 IKYXrgzhP6JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYhwAKCRABygi3psUI
 JPPXEACeYWZb6Qe8nVF7Bpg87QTBRd8nTaQXFDxCft9qSVL/dChn5t40irfJnq2OmMGGhV6/oO2
 FHRe0zhsQmy4E48rH83xK1VBLheqa0RZjwwLptucJpXKy+qXq35buXrD6bKnJVHTM/Yp+0ju5pd
 0oV4SsDH6hZGbWDVlGM16qYK8hTWjc9sPwNNzchy09+Tsf+pv/gw0UpRtKRehaEwqYSs6Jyi916
 oaJjfVxCqgY7rI9qjvyOT9Wes6MatAmXw7i/M/vM/+UhrhoOUuov2qhCeurLJ4j/1CLmjsgqnwa
 WBBCQLxF7dLZ+unE5hFTsIHn4WU7OQvs4Y8PSmCaBu2rPfK5UENIedJ+jgE29pYOEEq/Ko5Pjm1
 OpxwE30Ofmdd6KjuFcnfX0JwDPiEfXBKZrEofTOpW7gkxGu+K30zNOX620C7xPkm4NOS6RZYI6r
 WfADjrIsRFhbdn446jIdWmW9kGOvwW2+vJEwNqrSd3aViIMmYXbFlby0GVh07x0W6zTE7c/ONlS
 qGazaEzlrAhyd0CA2K7jQfvQOO+bgtBLGYFZh+9+SApOrfaY+fd+80hS+HOaKn3WiRcP9jyVJfV
 9+dl1gPAxMIsSI2G21SYfqvkkWR2ueWEiEAdhICY6HoKeTqxxpB/Kj7G5ifdC3ezDjjtZWm6mPp
 lkKgDgnKC85RB6A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 85a34dc7bc01088167d33d7b7e1cdb78161c46d8..f1415f50cb150ce1d33999c817243c3dc9184199 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -193,6 +193,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t7000-pmgr.dtsi"

-- 
2.49.0

