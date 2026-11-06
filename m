Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987372;
	b=FEEJmyee8JLjrOeeBkwitOIwK1NAvs1rdlw77hlx0RosCAwXxdLrhbxgfp6ENk6lnb4q
	 KbuOXsgMlFBn4C/WTPuZMBwzxSZAUgOf1/rhvO6LusX4HIk/TfiYPnMZwpF93/sR+78cI
	 rUi1Jwvv35zwgBic5pypJ/m8UckzBHK+2VilTK37xCx0riuCyu8TFLW3LjkA+BdOZhMa8
	 SXTlRkncDCVlFNgQ6/LlScOhqsK9195pS0EdQDtZB7eaHfSKy0+e11435mjmeneze+48u
	 EjTBWhP7eZ6F/tuLQqHrntIr3QWfKFDNMS9DnXXHfm31/lfw9by2OEqQWEMxNv8X9XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987372;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fYklhhhbRSQBfdXX2JpZkjACP3Hz9ptxY00BldJcWAs=;
	b=nZevQ2JZTWGvw1MffwoqzeWMgYypwIAZZdo+nE08pjY3eihjAuPhup54vgIz54XaH/bA
	 bwugZ2gU93DHjnF/VsP2Klf7RI8LzGY6cfRH/mGF8I0mFLKFGSCrKUuJ1sxjYmKnWqaK/
	 QHAVO2M0qnXEe8O+DyI6Ryo8WeubyzSI96AdhVWyBehP+DDqeg/8cH3lUXjcuQw0DdtN/
	 KNBMOgkgRuFvZYwEjTqkXIuDyGceo0UrXrpT0BbKyN0eMOHjepGOf4kIOKFvo2ym9WYB8
	 wgn0GWI54ZZVVN78G+dacE8MOfnHvv7EAFngFIrG2ZTf3WsVtUkfKa/iAp4Hi3P/qjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gompa.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F4D606A329
	for <asahi@lists.linux.dev>; Fri,  6 Nov 2026 17:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F4D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6d68de53053so624092eaf.0
        for <asahi@lists.linux.dev>; Fri, 06 Nov 2026 09:49:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987370; x=1794592170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fYklhhhbRSQBfdXX2JpZkjACP3Hz9ptxY00BldJcWAs=;
        b=kAF128LAAF4LTandGP8qSiXW3xjX2WSN9dKsH7hxow36gWuQ3aE7uEnT3T7z/cUJMR
         C0zRC8Pz/ARrvVUsdv6aQ+LcN/ISrzPKV7dCUnBiTCB2gOQD15TNypU23G+LI869oKys
         /aRTUgFShLHZpOx4QxMH6f6VDv0O7bwmq78A7HjYj/2UWhruOHa5AhYPm7aDU34vHh6V
         DWW0vm9ME9he05uS2u6EuSVH0gXz37FBWqUH88tRSty4OinjQs5UeLemLchXPdumgjFj
         S0ZTPgh3eZc77/vnDJ9oxmbcEkeokv6jiVpr4JF3Nz70cQpYCzQdrB6hJ6Wu6mvH4Rw6
         L6TQ==
X-Forwarded-Encrypted: i=1; AKwUvBxv6RfAk31qcFT3LPEgP+/4/5EN1d5XTYnsRLu4YE7FSDT6RiUZoOcFKtOqLi/2Ux9ynsfvzQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/ZSZzRFKs79kNk1FUZMUIZg8lpsLmPQzNFWiHR/cAwmzfj5q5e
	C5h0Jo+wahmeZXjmVg5Gdc3RTOmaQ5Kl967DIgLO9xtjxVOHcrCP/gfnoZ8ZKeVU
X-Gm-Gg: AYBFou0UE3WwJboEpsWzXuXK9iCl4ipE3CMTnLk4DEld4NVsOoyLKsgoWAR/3ahB+va
	9wn6FUKHRnqyabGxehqMv+T+JE/9V2x2Sg8PtBqflAMsJK0sSPtfBIbzNYxMGbfOaZOreE0n0Jr
	PKh6yWF9eUdqJXnBgZXaDMwBrFmwJwNq4zHYqfaWRpjkw5E2bAsZxFw+yUfCGX1YAj9/tSL79ys
	C3oVoXH4DUBKG74oFLpNwL34TQ322YMTBMOfBx5KSV2jtMefuh1szrOqJ90kJBa2iNZ241eaRxS
	1vIqZcZ//w38fWV1TtVoB4i/+6x+8gNn/bKPvRC3sSFq/IuyD/g8KEy7QY5/duh2RdGAtLd6WB4
	um1RuS1HTA0I/XgxyppWv/vfWW+BEMCgpKuSeKKX8iFMy6762VPvMcDU1TYMimGGdncUlv0+Dcx
	lKctoSCrU9xMfOeZGTbXZ9/zRQ4vWAhwrmWL9JEtvt4vT45To5Tk+9mq2OIyOMuVSsG8AnRGGM3
	utcxicz07Eb3XN1YONjtHXJY5yaZTmQYzKiKHus4wNGkq5FAHZv/RFmEToMQvq04dPgrjU2IR+c
	ZYQ0Twmw+ZV2+rJnB1ssxeVN6GjpvDFtNEz1NYNXWdly2KFcEKdm/EUlPCwK+mkbgkYVKa6QFof
	0E4G0pd6nF0Ynwfp3PmagPr6tKmNDILYgx7bBtnT20pSNvluDSk4R1pqgPnuX0CwqSEra9SziDX
	eEj/yVs0e0DBEawiAXq4R5
X-Received: by 2002:a05:6820:c30b:b0:703:10f3:89f1 with SMTP id 006d021491bc7-716e790edd7mr1367125eaf.40.1793987370499;
        Fri, 06 Nov 2026 09:49:30 -0800 (PST)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com. [209.85.210.42])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad9787dbf6sm2644436fac.3.2026.11.06.09.49.29
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 09:49:29 -0800 (PST)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-843a4ca671eso411405a34.2
        for <asahi@lists.linux.dev>; Fri, 06 Nov 2026 09:49:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz9GA4BOmsSQsGfDLYf+1Z9CVfL/exeA3uYoSB8O8c7UnIiz/eF39BePiCzGTL5APghbuTP4A==@lists.linux.dev
X-Received: by 2002:a05:6830:270a:b0:81b:9d18:75c with SMTP id
 46e09a7af769-85f1cf95bdcmr3174058a34.20.1793987369358; Fri, 06 Nov 2026
 09:49:29 -0800 (PST)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
In-Reply-To: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 6 Nov 2026 12:48:51 -0500
X-Gmail-Original-Message-ID: <CAEg-Je96B8OJwSR-3Kg74QCXyyBQ0CxYZ7UpLjvFn+UraDdjhA@mail.gmail.com>
X-Gm-Features: AclHuK8hoZuMZCPNLtXxjvtNoRHB9-OULlZW_Ke3tPYAl1aigN1s6wtlzqMd3Lo
Message-ID: <CAEg-Je96B8OJwSR-3Kg74QCXyyBQ0CxYZ7UpLjvFn+UraDdjhA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: apple: dt-check-style strict fixes for
 Apple M4
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:56=E2=80=AFAM Yureka Lilian <yureka@cyberchaos.de=
v> wrote:
>
> Hi,
>
> mirroring recent changes to the M3 and M3 Pro/Max/Ultra device trees,
> this makes the M4 device trees broadly compliant with
> `dt-check-style --mode=3Dstrict`, leaving the same exceptions:
>
> - the property-order and line-length issues in the generated pmgr nodes
>   are left as-is
>
> I checked carefully that the modifications do not cause any functional
> change in the compiled DTs.
>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
> Changes in v2:
> - Also fix indentation related dt-check-style issues (mixed-indent-chars)
> - Change the ordering only where the issue is still present against
>   current linux-next dt-check-style.
> - Also fix any remaining line length issues in the t8132 dts except t8132=
-pmgr.dtsi.
> - Link to v1: https://patch.msgid.link/20260924-apple-dts-m4-dt-style-che=
ck-v1-0-3ec651d75baf@cyberchaos.dev
>
> ---
> Yureka Lilian (4):
>       arm64: dts: apple: t8132: Fix indentation-related dt-check-style is=
sues
>       arm64: dts: apple: t8132: Fix blank-lines-related dt-check-style is=
sues
>       arm64: dts: apple: t8132: Fix line-length-related dt-check-style is=
sues
>       arm64: dts: apple: t8132: Fix ordering-related dt-check-style issue=
s
>
>  arch/arm64/boot/dts/apple/t8132-j604.dts  |   3 +-
>  arch/arm64/boot/dts/apple/t8132-j623.dts  |   2 +-
>  arch/arm64/boot/dts/apple/t8132-j624.dts  |   2 +-
>  arch/arm64/boot/dts/apple/t8132-j713.dts  |   3 +-
>  arch/arm64/boot/dts/apple/t8132-j715.dts  |   3 +-
>  arch/arm64/boot/dts/apple/t8132-j773g.dts |   2 +-
>  arch/arm64/boot/dts/apple/t8132-jxxx.dtsi |  19 ++--
>  arch/arm64/boot/dts/apple/t8132.dtsi      | 157 +++++++++++++++++-------=
------
>  8 files changed, 109 insertions(+), 82 deletions(-)
> ---
> base-commit: eea4f3b5e9e19389af3b99af64cdf7352b67c298
> change-id: 20260924-apple-dts-m4-dt-style-check-6e1f9dc92807
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
