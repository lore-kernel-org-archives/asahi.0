Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E9E18E
	for <asahi@lists.linux.dev>; Fri, 22 Dec 2023 00:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-552d39ac3ccso4483552a12.0
        for <asahi@lists.linux.dev>; Thu, 21 Dec 2023 16:03:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703203430; x=1703808230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nygtSlgImLShah/s0hAhy7POXlHZHpSLLGdVCujY6W8=;
        b=e3S0Wa2fFq3cpt1KgNKr/dChxr6sXjPFHzsyUOmkCOa7I8xex6BEeri2DUVTgEET71
         0Md0BLOGwuCA7yRqPLKQei38tR2TJBrdHFT5RmPTsGR2TgL8nQuY/MMItQR2Q5bkTvmx
         HY08nayO3e4IXW6WQL3ho7hImzBKeq4Vrbi318EuxKJOzLnS3kev8mX7wSKy/0A+Q/X5
         vy7kPqWHY8WRTYeYdHTkgYT1YwopyYZAHEtxTvINepiFtkv2Eqh94SKdEeMFcuaGIJpa
         p+im2hL0jQMKRxJkKNhHWtNk95yDidtli6KmXH9eHqA9NVuWCUXIDCdhbnaYPVbquiqJ
         8b9w==
X-Gm-Message-State: AOJu0Yw5VQEI9B4Xdv0/5ZEAxwltUg0CTXTN8bo+m0222I8dR+ABqEMD
	IcjPaWrE3+b4sgJkJk3JS7G73pMnw59YyaL6+AY=
X-Google-Smtp-Source: AGHT+IGVfNbQOUuVLU08NKjuaM5+ALIiExeerLAxDWvW0m6HVQjUnx27K4VhXz6VwnNk1oVbXtinNA==
X-Received: by 2002:a50:d782:0:b0:554:4277:b67d with SMTP id w2-20020a50d782000000b005544277b67dmr481606edi.21.1703203430347;
        Thu, 21 Dec 2023 16:03:50 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id u8-20020aa7d548000000b00551cddfc5b8sm1839355edr.5.2023.12.21.16.03.49
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 16:03:49 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a2370535060so452709366b.1
        for <asahi@lists.linux.dev>; Thu, 21 Dec 2023 16:03:49 -0800 (PST)
X-Received: by 2002:a17:906:1042:b0:a23:3767:28ad with SMTP id
 j2-20020a170906104200b00a23376728admr512450ejj.70.1703203429756; Thu, 21 Dec
 2023 16:03:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231107-brcmfmac-wpa3-v1-1-4c7db8636680@marcan.st>
 <170281231651.2255653.7498073085103487666.kvalo@kernel.org>
 <18c80d15e30.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <1b51997f-2994-46e8-ac58-90106d1c486d@marcan.st> <c392f901-789a-42e2-8cf7-5e246365a1ca@broadcom.com>
 <CAGRGNgW0h_uqHn0rKwGx0L41R+YgzgWPEh83kSKVCeqfCDeOug@mail.gmail.com> <C3F2FB99-C022-4BEE-8F1C-8B6F0E14DAA1@holtmann.org>
In-Reply-To: <C3F2FB99-C022-4BEE-8F1C-8B6F0E14DAA1@holtmann.org>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 21 Dec 2023 19:03:12 -0500
X-Gmail-Original-Message-ID: <CAEg-Je98F8BqczZR+8dBT9-a8Tb3n3L5+TdWJsGfFDUFt=Lf7g@mail.gmail.com>
Message-ID: <CAEg-Je98F8BqczZR+8dBT9-a8Tb3n3L5+TdWJsGfFDUFt=Lf7g@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcmfmac: cfg80211: Use WSEC to set SAE password
To: Marcel Holtmann <marcel@holtmann.org>
Cc: Julian Calaby <julian.calaby@gmail.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Arend van Spriel <aspriel@gmail.com>, 
	Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, 
	Daniel Berlin <dberlin@dberlin.org>, linux-wireless@vger.kernel.org, 
	brcm80211-dev-list.pdl@broadcom.com, SHA-cyfmac-dev-list@infineon.com, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 3:40=E2=80=AFPM Marcel Holtmann <marcel@holtmann.or=
g> wrote:
>
> Hi Julian,
>
> >>>>>> Using the WSEC command instead of sae_password seems to be the sup=
ported
> >>>>>> mechanism on newer firmware, and also how the brcmdhd driver does =
it.
> >>>>>>
> >>>>>> According to user reports [1], the sae_password codepath doesn't a=
ctually
> >>>>>> work on machines with Cypress chips anyway, so no harm in removing=
 it.
> >>>>>>
> >>>>>> This makes WPA3 work with iwd, or with wpa_supplicant pending a su=
pport
> >>>>>> patchset [2].
> >>>>>>
> >>>>>> [1] https://rachelbythebay.com/w/2023/11/06/wpa3/
> >>>>>> [2] http://lists.infradead.org/pipermail/hostap/2023-July/041653.h=
tml
> >>>>>>
> >>>>>> Signed-off-by: Hector Martin <marcan@marcan.st>
> >>>>>> Reviewed-by: Neal Gompa <neal@gompa.dev>
> >>>>>
> >>>>> Arend, what do you think?
> >>>>>
> >>>>> We recently talked about people testing brcmfmac patches, has anyon=
e else
> >>>>> tested this?
> >>>>
> >>>> Not sure I already replied so maybe I am repeating myself. I would p=
refer
> >>>> to keep the Cypress sae_password path as well although it reportedly=
 does
> >>>> not work. The vendor support in the driver can be used to accommodat=
e for
> >>>> that. The other option would be to have people with Cypress chipset =
test
> >>>> this patch. If that works for both we can consider dropping the
> >>>> sae_password path.
> >>>>
> >>>> Regards,
> >>>> Arend
> >>>
> >>> So, if nobody from Cypress chimes in ever, and nobody cares nor tests
> >>> Cypress chipsets, are we keeping any and all existing Cypress code-pa=
ths
> >>> as bitrotting code forever and adding gratuitous conditionals every t=
ime
> >>> any functionality needs to change "just in case it breaks Cypress" ev=
en
> >>> though it has been tested compatible on Broadcom chipsets/firmware?
> >>>
> >>> Because that's not sustainable long term.
> >>
> >> You should look into WEXT just for the fun of it. If it were up to me
> >> and a bunch of other people that would have been gone decades ago. May=
be
> >> a bad example if the sae_password is indeed not working, but the Cypre=
ss
> >> chipset is used in RPi3 and RPi4 so there must be a couple of users.
> >
> > There are reports that WPA3 is broken on the Cypress chipsets the
> > Raspberry Pis are using and this patch fixes it:
> > https://rachelbythebay.com/w/2023/11/06/wpa3/
> >
> > Based on that, it appears that all known users of WPA3 capable
> > hardware with this driver require this fix.
>
> the Pis are all using an outdated firmware. In their distro they put the
> firmware already under the alternates systems, but it just lacks the SAE
> offload support that is required to make WPA3 work. The linux-firmware
> version does the trick nicely.
>
> I documented what I did to make this work on Pi5 (note that I normally
> use Fedora on Pi4 and thus never encountered this issue)
>
> https://holtmann.dev/enabling-wpa3-on-raspberry-pi/
>
> However you need to use iwd and not hope that you get a wpa_supplicant
> released version that will work.
>
> So whole game of wpa_supplicant is vendor specific to the company that
> provides the driver is also insane, but that is another story. Use iwd
> and you can most likely have WPA3 support if you have the right firmware.
>

wpa_supplicant is perfectly fine if the necessary patches are
backported, as Fedora has done:
https://src.fedoraproject.org/rpms/wpa_supplicant/c/99f4bf2096d3976cee01c49=
9d7a30c1376f5f0f7



--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
