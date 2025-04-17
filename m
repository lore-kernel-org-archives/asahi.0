Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B8625178B
	for <asahi@lists.linux.dev>; Thu, 17 Apr 2025 14:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744900034; cv=none; b=ehldYV2DFV3LgvVrSk/aElBrmwO6zWt1sC9JiFGsQMYKabAP/kx96SAoqNcxZtDVo0ttQQAsIE/Tg95/rmkzTTQnQdrflewaJ0kaP3Qls/bF8S5+3iwa12CR7V3FXOPVT5UEHQfCY/SorUdfPRwDP9Ln6tD6oCttUduTVH2CRJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744900034; c=relaxed/simple;
	bh=H5LcbxHIEsi6NfNXL48aB+b5/EUn547ceJU8rD/SnfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YyYoydpjcRvla97a6feVEX7fTX5MRQ0lkoCFxRJhWa5s+bLdpF072zeak+kK+9/MrQKNOZzqV3FtMm7wstd8TCKxlEIM8otaI8BCf6ZewXAJqUQekYQNbGF4HDW55TV3p27o++ijzFZswMyOvShC/N6hYhSyYQmT0+SHcRZBmgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEvePeJ0; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEvePeJ0"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6fead015247so7543517b3.2
        for <asahi@lists.linux.dev>; Thu, 17 Apr 2025 07:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744900031; x=1745504831; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H5LcbxHIEsi6NfNXL48aB+b5/EUn547ceJU8rD/SnfA=;
        b=kEvePeJ0R8eqHdD/EtKPdw129VBygQQVdy7GekCBz6hiwomBTKf7wwmlNVEV2piDFo
         JdwpGwPWJ2Ui8T2fqzdVhqocCio6FgWBjHZ6F0mUPSs1S2Phr1LiPh2hEHsVUa8lFPtN
         /Su7wrUTSvrXLYqFyxvhmu2zJ7xk1kUH8OOpvsMFazG56zlAmQ5X2y32aEVF1mxU5zhl
         MnzHePWjvN2AQ8pFdPFajcEL0sGma4C/T8QBLbuCJniEgsf8sKj/Ng5K0DYMoUUgN56s
         kfglq0Wn8cmfxKumzmTm6zqrXouUHDFoE1OdJKMUx80JR0xtCUGFlzCohuoMrlQMp18X
         wz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744900031; x=1745504831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5LcbxHIEsi6NfNXL48aB+b5/EUn547ceJU8rD/SnfA=;
        b=HFznfh5kLnP5sNXaRBAfO0yImdc/N1O1NjSV962kahsmeQmIwPYWEBj3LtBC3DnUkY
         xwfVJ1MBtgZakECv5x0UJNgaF0DFqpa2+I543XHUs9L0Fd8dcU6BdNBRpgKzP2JUxEGJ
         s/iskCB5xT2HHxJ1AKuBBNj+2OmslZn8DXS3NFoEkN+GWc11uye+e5vi4b0Oqh9iAxYk
         N/mGaD7qqtm1EYaJ5RwK63tNGLl0B42VA1XP1oFY9I3h+cZQ4bvYbDnZU52MqjfkX38x
         +77l+3qzX7DoBqyFSzioG/CR+s/mys2y9rJCimZcK3RxHwdo9Xta26c09Lg4Efappebe
         ryNw==
X-Forwarded-Encrypted: i=1; AJvYcCXyafZoW2SvMIY/crWxr6QlwF3z/9wMlPVO66V5QDgpeoYzW4f/N+LCtEPOkXSNNaaxY3A+Ww==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4S6Nm1z0734y4yTentPOYKE/+nOv1uuI4qlVwVLGlMCwaQ5Ck
	JY+n3sKe9cKp+x1tVzVooLgvUmYWu4Cd+fpIquM/nFjRjaoF0erbHB/vJmjX6jYB6Kbv69Al3Dd
	AZ/T3nEY1GElT05lDIIxHZIKWA20=
X-Gm-Gg: ASbGncu5XpOuOo0DneDnR6BLzmxzfRvdm2ljeoqoBLV88xhGdSF+8rWevmX5C1E6MNs
	+VoV7DsgyKvFHLyyAi3otb08oGgE+Bhuyrx7Fjh6IGZ5K8S/6Xlmz7Ufkl+ooUYJywkNXS1eNlF
	4SwOSI68Yr9Y+DFI1/XZNCd8g=
X-Google-Smtp-Source: AGHT+IFlsRdoOPNKP+IgFk3s9dutZbcvjVOYZpKbxlSBuHkLsa+WbDm4tMUPjfUhVNf9zruI9fG719C6Puhpz/icXwI=
X-Received: by 2002:a05:690c:6b83:b0:6fb:91a9:94d9 with SMTP id
 00721157ae682-706b3255c50mr92412037b3.2.1744900031538; Thu, 17 Apr 2025
 07:27:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com> <81fb1290-fb39-40b7-9d79-f147fae5b269@kernel.org>
In-Reply-To: <81fb1290-fb39-40b7-9d79-f147fae5b269@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Thu, 17 Apr 2025 16:27:00 +0200
X-Gm-Features: ATxdqUG-QdtnFm03q8e1kJSl7Bv2F6tlWh8pqcBflMsEFPTlm2gMwGAFKqTZq5A
Message-ID: <CAMT+MTQ6gtQaMpH=5ATtJ_A7X6EjT2ra2UAe_1XiDAk1YGP2Zw@mail.gmail.com>
Subject: Re: [PATCH 2/3] nvmem: Add spmi-nvmem driver
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Apr 2025 at 15:34, Srinivas Kandagatla <srini@kernel.org> wrote:
> should it be:
>
> depends on ARCH_APPLE || COMPILE_TEST

No, this is not a driver for an apple-specific hw, but a generic thing
for re-exporting
a set of spmi registers as nvmem cells.
