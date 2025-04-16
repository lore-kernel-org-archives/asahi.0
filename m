Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C71221567
	for <asahi@lists.linux.dev>; Wed, 16 Apr 2025 07:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789208; cv=none; b=WrMuFbYW6lusqS4rvEP9oTqGmHcFKM+SlabX9WKlTi+fudpE3U5LceH9O9pR/KoooXfMaJj2fncULrqPv7tfW/4eoX1J9JQwUXQObF06VmXnnAerKmEjj/9p5yy81n1pEqPReCmxnK38G+ZyIuljMnhMPxVrs8p2vRRqP3MX3WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789208; c=relaxed/simple;
	bh=0WPXE5cu+KxNpShEllczcd7X5h1MUBPS2Pl6xYsNrzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CfxFQcSns/ukK+2/NMc6XYwGwySu/0+ZOJJ3TQQMpydfR5mMXAqKC3hvkPLs7holvPUkx4s0YQQ5YoppolMfsrKicvZMgalracJ2pZpf+E3i0gMD/iBw1WRYT5WeXvBcZGBydCeL6wdhwaNhDN/FELrVc54CrZVjEwgRCgT7KIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ga8n4BtM; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ga8n4BtM"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6f6ca9a3425so76365157b3.2
        for <asahi@lists.linux.dev>; Wed, 16 Apr 2025 00:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744789206; x=1745394006; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0WPXE5cu+KxNpShEllczcd7X5h1MUBPS2Pl6xYsNrzA=;
        b=Ga8n4BtMtA15H9G1RN2LFj9TvwDOdIRaCOWBvrNYPHfx7NpTwVOmR8iowO+FJvYMm3
         JFU3xbTlhoqil/9ds/5krG9glPpE1usDiPixAmKT1qqrzy2u4Stuthhr2Bxru29eMPL3
         3Vn1RpsXpoAvQGWeKudm7Mn9laU9PUmF4olHgvdHdktJWdw214eyNhhMlvzpX9kq4k+J
         jxyt46qo16qoyPyj5LdUSF2J+Zf3A+zBJyr2MWPgUmey129wm0LeQycgN1/WJwXmw+HJ
         ayKEwkaJkfXKrctJ4jaRLL29J4oT+Z25vkowEJSeLX1zqSEZ5Ml/QW8EymVSJ51/uy5U
         kZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789206; x=1745394006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WPXE5cu+KxNpShEllczcd7X5h1MUBPS2Pl6xYsNrzA=;
        b=YXJsxJDutm5G+wvQ2bdVvTVKQlXGQ8NOBrFMT0qhlYA9BPaYIwGizNudAgmCkOZaJG
         ZSuyWJSFYXsKMhOr7bPSNwJI5WM9xIqoymAlaLDxJRetKcrkdlwqHWnYe2WiED85dVLt
         02/0T3GGvQdO2xhatiUWd7Ymmm6BCVpP58yOeKQH717omUqmpQxlCE7j6V/UQp5la1d1
         vFhdX9UwQcuzaAsMdtoMn/zDQOefpJaZfUToKTJ/+zZzygcxUQ0JaPpFc3W4mCXTXOeJ
         nDZA3Vh1iQc5TzFAzQEa8iJaoW2t5lB18lHhIsjgs8KkwAxjBfIfGr2lyfRRP5TlWolY
         mC7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV86qo+HL+RnST0p00hgjN7BE53k75uo4BQAVoiflrUimLr56qr9vNwNjghc324ixfEoqgPpQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjGOto2E8U7D242dgKTaVqEcw2tyzv/r8LJsi6flw+NY+bANXR
	R1kwIqvlNcr3aGxbUvqbNq388idxlU+uVMy2ZWmkLy/uyvy4SFrNcgwJZesYtvtssAJ7ntj4CVS
	0/34CR/wg/Si12Qk2hdIMDWJdFJQ=
X-Gm-Gg: ASbGncsJ3feZ3bH4Hezy2GGysFzVYiXKtu9bvKVInJCnt0v7JVeFprMUW3ebcWxJ1ex
	tJpOvqLQfG3Lp3jlbGi4/6sLYZS90hU3MJCtejQuuRd2CniV81EjqoVjy65j/Mt0Nfgp0q9ZUZV
	sV54vOkzUhtpL8f/igxG9CJA1jgl2iD9ywEg==
X-Google-Smtp-Source: AGHT+IHxbekuxWHZw8zM+wh6DzTFP8yHpFvuhbdM9QR05wWnGQlGmcOgzlNDdA0KhXBzuIW+VyQTVJg2vQPk1/AsoLU=
X-Received: by 2002:a05:690c:64c6:b0:6fb:8461:e828 with SMTP id
 00721157ae682-706b33627f1mr10607287b3.30.1744789206293; Wed, 16 Apr 2025
 00:40:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-1-22067be253cf@gmail.com> <63957942-173e-4c28-932e-a8ba7c60ee83@gmail.com>
In-Reply-To: <63957942-173e-4c28-932e-a8ba7c60ee83@gmail.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 16 Apr 2025 09:39:54 +0200
X-Gm-Features: ATxdqUGe8fo0djVdgl0BDmuxVBDLtZEU6DP9B-jNfmxJRRmqMcv0gVTVOL0H8A4
Message-ID: <CAMT+MTSqdzg9pBCW0qB1KMK4t9w0-fM=vRowO0kWVNqK9GtBRQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
To: Nick Chan <towinchenmi@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Apr 2025 at 02:18, Nick Chan <towinchenmi@gmail.com> wrote:
> Also, the PMIC definitely has more (mostly independent) functions than just non-volatile
> memory, so I am not sure if it is really appropriate to model it as only a nvmem device.

It is good enough for the PMICs that i am adding, there are no plans
to expose any
other features to the os.
