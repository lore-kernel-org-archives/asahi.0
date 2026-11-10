Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794309998;
	b=kCycT24QFtqyNX+HGmstVEwg9XzxDqy6dD2VVa4GgEn8/A+14AOpRr+lTppaNhsgqiAe
	 OFFqjwGzDlSXdk4PZtCe4NTNHLL6W37ap7O4b7a6SFtt7OS1mrsGAgXFb+eH6A7CzX7Pm
	 N7xjBrN8RLaSPlJozL+4eolVY/oEKhlUe3psZzR6ywjMhAlqHMw76TCZkVbnikT9tB1vd
	 AudlRL2ibDBuHl7/lFrYwd0Eu21bQV9bkyDfNgehLtlWTb17DGIk0zqnHHeB92ryqygWn
	 /8UN9OciXlc/mov7j5Pen6Tc3bNtjibjJ3cokexB5/mcrWQGj/PIoa0gOqK7Lgs/isg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/JeUA5XPTGoy/KR5mIq1snlQu7zsd7kO4TAs7obddKQ=;
	b=dokjc0DsdcXNmXOdjIBFTbb2vraZl8h2ewqV8zubzvjAtIk7hCxjzgVugG7pTcsho63v
	 U004g+9x3HdLpSiH9+pIyZk2pY3dXYi/wdpfpSgADIxkcanQ0SO1pF3HrSEHncNPRijv5
	 tLKARsVV2561lV7xX5WQssPrLaXW58mgXoqhXirHx5LCxym4GZec/2YWY1sdClNRQQqCx
	 0Qux0Nrf8J+r84LXdWpPXuYy+QTvnsoh7NYnMnJujZi6DbhLUdgd0Oio9gRA43aIQLk36
	 gPAdS5NjEFaXJC4UwQ04kPkxHTIvRxX0R3doLnKenm2pC4NSNktkudQTUgnBo+gvLnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AaOVNnx0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8DF606A31C
	for <asahi@lists.linux.dev>; Tue, 10 Nov 2026 11:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B8DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AaOVNnx0
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b305312e4fso15313087b3.2
        for <asahi@lists.linux.dev>; Tue, 10 Nov 2026 03:26:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794309997; cv=none;
        d=google.com; s=arc-20260327;
        b=shyw7c5dM1ujpxel/YVBgexW3oz+ZiWHIo4eGhyX6c343Q+IVxIV07ZPnLxrwQy2Hp
         PFjJXk+Msfb1nWgj0Wqgu85ZEeAd+Z0sDznA6e71H9f2vQVS4G1g1px9nShe3Mgbd/wP
         T7SsOMiLyR0ILpb5fr3DJAFiieCRgffOpBmbCw34SCF3rWarML8xklxuhxvw+fU8oNSo
         0TtLshALGTADbk4imZE52AeQ2MzwBb9hW4T7mSIKVfitMB+e2rEzng2OEMpvDq3qAc5/
         a93ROi/LtGe2Ynu+Vju7ocTgh2zkY9NNgrkqKQBy6fEBcqSDwjf/yHwkzkrAmr+YrXoj
         trPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/JeUA5XPTGoy/KR5mIq1snlQu7zsd7kO4TAs7obddKQ=;
        fh=u+0oGyE75Zfwav6bu2uGKvE+qEfONMoplj/xnHxKGQg=;
        b=BNVupFk4q3eDLK5QRBsUfau9Yrtsr2Gnd/AkiEo0FMXpq/s9CjzWyWrRHpU5OZ+tws
         NXu3zE4tGhOxQiUmFBfnW+AeY55R8agLia7ZmHr98NgaW2VAVl+3VOGO/XApcAxMbygn
         NVlIzXwyKDzvjmshkFJmpwktrVIHJogJIWhscaVn/SybXFBvlTwRYnw0+/vjvcRIMRC8
         GkD5UC0OWg2gRYGK3vqc9i82/Dgt1ItcS8D2+HFaCpe78ssv1+rW3jQtWyCMefkCjZIb
         9nxwd9qp9dTphGfuxqOrVU2UI/BE9Za8SAYk9pWCqGauP3Mpp6skCc+RO8SfIHvja3bj
         FZ8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794309997; x=1794914797; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/JeUA5XPTGoy/KR5mIq1snlQu7zsd7kO4TAs7obddKQ=;
        b=AaOVNnx0DGu4j4in4nXSvFPOfT2vmB32VtV/Raqo+waROiwioDTXqIDbQY5qdrPEi/
         v5bC4SsAbaXDrYUacSkJXDZxBV5Yi6xYhsxr3v53OUDJccHEP9l9wUzbTdLWDkoqYMFw
         DyJvSmrpDnMhYLO3SI9zl5LNT6yLN4yjdwVcRm//ccUoBBAl2n6RjhrqWfLV7Fp89muX
         wg6m+5O5biCvOJxo9gQIlm9p+/5IDx/qoWdTtdVzkDmTnHNcyfjETRH8NaEYXNlyt42c
         GNW5aeDSxq2YizWfoDjSx2pqbV6qp9rGDYVsFZjpsjM4M3Kx/iwqtUDVXO4kXzFX7g+d
         uWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309997; x=1794914797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/JeUA5XPTGoy/KR5mIq1snlQu7zsd7kO4TAs7obddKQ=;
        b=JI/abmwO3nHv/4B3erw5M+5MII4sEzIdG0IxQlztHCyfLW5x+Ik8ghRfqCwFdTwMK1
         hOJsc1zJ+gHW1qo8F1e0XCLeI1K3XfxqtKfmNrSoOrFdEXwNTuL7IRDUYJiuEWUxWU2b
         3GYHczfrEIUVQZZ4MMLoBCIvD/SBZONu8yORYFOWOms6ZT+jUQwdc8Ho9MfDkYkbtYeo
         laT2PJB7dMt1pPRRiC3C4RD7uQ2m/Pkdur5Qd3dVFFmYr6446gzQcpGLSkGOEkT/41Pu
         +1n9N8PzlLWMtH7bvpQJQWwJIpm9B8pe8Mz3mvRRIt8toKCPsfEG1ojCfh4ARaX2Sjpy
         S0rg==
X-Forwarded-Encrypted: i=1; AL+hErHAoTw7hAD2UUpNjKcZEYT5syOB60PqDmDrF3/sczZfmWE6RNxP+EL9+IKe1NHpFRoW9aoj1w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/NDujoCLTn4zWkgFoCvxXSoBDV2JoVKqdrjCLYBQlrAgfEJx9l
	i8C7foWBkG3DkmJ/H6qRB3WyBujUprdfXZDnK9DQy93TtIktgbgUeCFVjfiJFP+8pkopUIgnsj2
	h3n4o7f136fTGOh96jWGDRh5sJVwa2To=
X-Gm-Gg: AYBFou06vd8c+rfuEkITUQUhFh77vLwj7NHwLfLHIRBfvBVdI/f1NscPhftm27HTDWc
	70C3zrNVGpNUxd5x31RcIRNkjAn7i1w4Hjdu0LttAxIfhUZ32RaKSj5IXu5Wel6+KxOrpYIP6wA
	5tFEV33D0dH5Qea87cweBtzyVsQXcnKGmEQhKZEYxa6Prqsstcvggz4HN1SCOaKOBag/ff49eOb
	FnEzsddhgCfav7aHk1xah4PuGqoQPwQ7BzvuqQ4Fo9hIWrbS9BbzZRk6mHch587V4KFW3q2CE3q
	HsW1SAwDbZUCc41YxuLl4v/He3kKhXUsXuf/RAZU5KahbS+8T5CyePIQNMA9DJcJzx9eyYdcaYQ
	4n79eJFFu6Vo7Yro4hk8HdSORv0R4dgh4wdydEQ6E4BN8QNltKv4ArZUrPWF0Iv928bt1kuzXmM
	jUeVeHMJ+35WQpUy4+bQRbn4l0ZhjFze1TVS886N0jUDRuEeI=
X-Received: by 2002:a05:690e:4506:10b0:67b:e544:7adf with SMTP id
 956f58d0204a3-67c567cb670mr755726d50.104.1794309997113; Tue, 10 Nov 2026
 03:26:37 -0800 (PST)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
 <20261108-b4-apple-mtp-keyboard-v5-2-e2c97b82669a@gmail.com> <20261110-accurate-unselfish-cockle-3a39bd@quoll>
In-Reply-To: <20261110-accurate-unselfish-cockle-3a39bd@quoll>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Tue, 10 Nov 2026 22:26:25 +1100
X-Gm-Features: AclHuK-5Sr8Vu0dogwKG9EMBtjFYwuxFFj20UBqhmDk8dxo-p_0NSr8q2RJWh1g
Message-ID: <CANpmGNufv4_PM=1D1E-KRNQOuCPj8k+sGUJ1Y2HkkAtoSuL0Ow@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: input: apple: Add DockChannel HID transport
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 8:20=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> Just an enum instead of items and const below.

Thanks, will do in next version.

> > +  apple,has-stm:
> > +    type: boolean
> > +    description:
> > +      Specifies that the coprocessor provides STM device and serial
> > +      number query endpoints that must be ready before registering HID=
 devices.
>
> Isn't this implied by the compatible?
>

No, it isn't, because whether there's an STM or not is decided by the
type of trackpad
used, not the SoC or even the MTP coprocessor itself. My wording in
the description
wasn't great and I will make that clearer in v6.

Rob suggested apple,has-stm as feedback on v4[1], we used to have it
as a separate
empty node.

Right now, as a heuristic SoC works because the only device to have the "ch=
eap"
trackpad (and thus no STM) is the MacBook Neo, which is the only
device with A18 Pro.

But that isn't guaranteed to be the same in future. I don't think it's
right to base STM
presence off something which actually isn't the actual determinant,
and just a byproduct.

> > +
> > +  hid-country-code:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      HID country code for the keyboard layout variant.
>
> What is the meaning of values? Do they map to any existing ABI? Like USB
> HID? Otherwise, why country code is 32 bit integer instead of ISO3166
> codes? As pointed last time, this should go probably to a common hid
> schema.

It is USB HID country code. I will specify that in the description in
next version.

Would you like me to add it to
Documentation/devicetree/bindings/input/input.yaml,
or make a new hid.yaml in that same folder?

>
> No default? Not required?
>

I will make it have a default of 0 in v6, so that way it can be
omitted by the Linux
DT. The intention is that the bootloader fills/adds it.

> > +            hid-country-code =3D <0>;
>
> Which country is 0? Isn't this just a default?
>

It is "Not Localized". As said above I will make this the default in v6.

Thanks,
Michael

[1] https://lore.kernel.org/asahi/20260925-apple-mtp-keyboard-final-v4-0-30=
4c267518f4@gmail.com/T/#mc53edc016ef1484c18e217b941b927bbf86f2cea
