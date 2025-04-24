Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3AF193436
	for <asahi@lists.linux.dev>; Thu, 24 Apr 2025 02:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745460817; cv=none; b=p1L33tvTTjqx990JDC7hPFp39z66kVK7B4RJZgU6OJ7eOfPfG74ABqCKLPvQKwtHxiRUYtNlvpTUZFa/l9x0qsls0sGbF5dwOMayPp8Q2hB5MMCJiBHIhwIiRhA2kh81IZswONFVJeDU90xSboETBFlDVzPvxRvqHsQIuCPd9/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745460817; c=relaxed/simple;
	bh=ubU7OUBvyo7wi7WpdYTyiErLz39JsBxbMdo44Y4Gj78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VbitqB5GhEtSlyiBfEUBTeSMsHXDCJCMmNqeJDvLLfuLBi33iNmUW9j5y6YQTZgdvZnqUyacpOmIFMRK5ccLgrKZOy8K+bJIaFIR7u8D72B5OpjD/I/5zCLJ0J11hsZuLrwKrgLYgsEF339DZ/TLbwi1VnuhHTWmqiIlo8TLa44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso2967507a12.0
        for <asahi@lists.linux.dev>; Wed, 23 Apr 2025 19:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745460813; x=1746065613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CaiYIHovh3hj7JhREmKYSulniFNMpmE5/FQxCD5M2gA=;
        b=qbNf2ONFWOfm2E3l52BtUsML2CpWQyAsOtYqjcOsKCY+gGXbUQST0C3lebV3LqISrP
         ETC10IkrYbJLeuXgqTqZ1hfmvDb4T+xqezYLAtr/ICvRXG1rYkG90anfxBB3tnJxF0Dz
         zJ8qbxK9kZPUbPQH47rFcgh3SwYNUvG7Yy4MoyPcOJjycy7Hhg1faULtQwV10Z+WiGgz
         lluCvw0/kMDopDPGe65ypVFdpZMplSNwNntQLDhIaw7SsSJ9IPl134FJ0oD37pRF5wyR
         RTPfmHByfxLAcFldQzv0h7GMgzYxSyvTA7C0Makzg4cWAZwuFlQQqcsGA/AdLrdi4cM8
         kUSw==
X-Forwarded-Encrypted: i=1; AJvYcCUQutJUr12Ed5Vl91lmzMpknfnLxeGpxBhuQwqiRbwo0eRPp+b7xJGFD+typLcym7wX0Xt+VQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YybXJ3dYXB2+QGPamR+4G8KJ0CsSHyv7ie005Zm08lIKNSZAdv1
	aFO4pLI1LGnyanX0XRZZDzYw+1nmaPh21SYlXvczNxpht2hiTQbLiwK39zeA1iQ=
X-Gm-Gg: ASbGncsp+NT8biRPJ1De7Ylf+503+NNEzzV8N1pbixkBHhHFkJ9sRYHzFZQtuo/BrmP
	uOEFUSxCmUAhwHElY688kTQBKcrqE6LrtVEf5VeN2U8wNYTK4cSuhTBRG5PCoF0WHQKHWYPKam9
	FtP3SonAQA9tKyhRXpynnQh/mrV1EDAuhvPyYlvHdqF/UgNtdyfVMEvmww35TuaKF33/9wvPjvU
	UdEv00+bRFq5hzwpki38AS7ZnrBrAUEjCXNjDvebpwv6VYKYIaqgUKe5R8kiWSmRnV2rnuC3KRB
	HEdQKsm79tPb1eq/Nco9bneB8fChF0bnzpLND3PG3Df+M9EH5LURjVpxFp3s8c92o2u/Jak=
X-Google-Smtp-Source: AGHT+IHX6GRfgag9/trARS9SXo7KbBxxMVVoYB6aO/Per+j6vrJKI0hVFMREWq1R8Nink7AU23QKVA==
X-Received: by 2002:a17:906:fd87:b0:acb:4d5b:d1c0 with SMTP id a640c23a62f3a-ace5a1246ddmr57253066b.6.1745460813368;
        Wed, 23 Apr 2025 19:13:33 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59830eb0sm27910566b.9.2025.04.23.19.13.31
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 19:13:32 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acb615228a4so274831866b.0
        for <asahi@lists.linux.dev>; Wed, 23 Apr 2025 19:13:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXEKpGpsx7/ajRInyd065QshnAa8I1XQvorzj/qu/2UGDMI3siRyWDW5T5ZnjgLL+XZibJoNA==@lists.linux.dev
X-Received: by 2002:a17:907:2d8d:b0:ac7:3441:79aa with SMTP id
 a640c23a62f3a-ace5a2a9b58mr54104966b.13.1745460811360; Wed, 23 Apr 2025
 19:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250423-spmi-nvmem-v3-0-2985aa722ddc@gmail.com>
In-Reply-To: <20250423-spmi-nvmem-v3-0-2985aa722ddc@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 23 Apr 2025 22:12:54 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-n+=dHzt3b5oDCk3uYm6vBpsFzy-47sDeJB_=rs7OR3A@mail.gmail.com>
X-Gm-Features: ATxdqUHYt94bW4xL2oNxmmXaCgYQX3z4Kme1wD4CvmsQsfVBIo41Uk4tiX7FjQM
Message-ID: <CAEg-Je-n+=dHzt3b5oDCk3uYm6vBpsFzy-47sDeJB_=rs7OR3A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Apple PMIC NVMEM cell driver (Formerly: Generic
 SPMI NVMEM cell driver)
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>, Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 1:55=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> Hi.
>
> This patch series adds a driver for exposing a set of registers
> as NVMEM cells on a SPMI-attached PMIC on Apple ARM platforms.
> Those are used to store the RTC offset and to communicate platform
> power state between the OS and boot firmware.
>
> The NVMEM cell consumer drivers will be sent in a further series.
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v3:
> - No longer try to make it generic, use for the 3 relevant PMICs only
> - Link to v2: https://lore.kernel.org/r/20250417-spmi-nvmem-v2-0-b88851e3=
4afb@gmail.com
>
> Changes in v2:
> - s/pmu/pmic/
> - Sort dts in unit-order, instead of t600x-unit-order
> - Link to v1: https://lore.kernel.org/r/20250415-spmi-nvmem-v1-0-22067be2=
53cf@gmail.com
>
> ---
> Hector Martin (2):
>       nvmem: Add apple-spmi-nvmem driver
>       arm64: dts: apple: Add PMIC NVMEM
>
> Sasha Finkelstein (1):
>       dt-bindings: spmi: Add Apple SPMI NVMEM
>
>  .../bindings/nvmem/apple,spmi-nvmem.yaml           | 54 ++++++++++++++++=
+++
>  MAINTAINERS                                        |  2 +
>  arch/arm64/boot/dts/apple/t6001.dtsi               |  1 +
>  arch/arm64/boot/dts/apple/t6002.dtsi               |  1 +
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi          | 50 ++++++++++++++++=
+
>  arch/arm64/boot/dts/apple/t8103.dtsi               | 50 ++++++++++++++++=
+
>  arch/arm64/boot/dts/apple/t8112.dtsi               | 50 ++++++++++++++++=
+
>  drivers/nvmem/Kconfig                              | 13 +++++
>  drivers/nvmem/Makefile                             |  2 +
>  drivers/nvmem/apple-spmi-nvmem.c                   | 62 ++++++++++++++++=
++++++
>  10 files changed, 285 insertions(+)
> ---
> base-commit: 2e0e70c95077172b29a5b13716c4b159d578e82c
> change-id: 20250415-spmi-nvmem-e08635316175
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
