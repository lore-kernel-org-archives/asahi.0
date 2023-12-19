Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6D41BDF4
	for <asahi@lists.linux.dev>; Tue, 19 Dec 2023 14:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxcnjuH1"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-67f2a5d8a05so25748776d6.3
        for <asahi@lists.linux.dev>; Tue, 19 Dec 2023 06:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702996001; x=1703600801; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wM23hrtmmwZJoFn95qL7Z6AlVX+PhKPgm+RhZG4LXDU=;
        b=bxcnjuH1JD4fuQsX7AWXvhRQqvUz7M2mhMHElE1OjoXapoTaZQzULLEK+oEGnjjvkZ
         XXPIFV/2ez3UNnG3iCTY456wuhX/q1nSQMQqECmKqQvfdIBNe4yLSxtZtQ4k7Lp41vb/
         p18nh0ZNjrp0bFOArt29Tr4OccdK+F6rtr0aYXMntIjtRrQEhE4suMeH3L1VTH/gdq+/
         zzjoJh+sqH7+cO8uO5ZkS2ANDIYdfWU0rFeKYy/bGn9V4X7A7MRgXj8YmFLaT7PMcoXw
         QYnIEPTEzVacCoscRWZE6TNuQw1tTFH7gxGoD208Zxz7JNTXMdS0k6fDQoDwfIl9jxFX
         z1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702996001; x=1703600801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wM23hrtmmwZJoFn95qL7Z6AlVX+PhKPgm+RhZG4LXDU=;
        b=faOD4/8cHCzhrnklKjLAOFYc1ayJ0udQ19dj2kyICN7Dipv0J73CyjYwCKdVjJkN61
         JGNRkl3MwQ144eFVxC0XJ/6k415iKWvO8YSeXMEiKyR+J1VckUhH3swVqs7hDBb5xGmN
         I6ydceR+8couXUjh5AVgagHRpFuWdHR862iV7DLNRt4XoLdRCx/YYK6TmKY7a/k7JkqL
         2dWydydt6JgX5e3WnB+kjm8eBDedvsZhA1fTcbjGaqxI9YfG88xLO7ts1VvHLg9ZJVEY
         vKTi7ktBtSiRjmTvoAi66390MoJgZo+bQ5w8cLg3MsI9K6azCKyM81irNevgyPycNrDP
         DlVg==
X-Gm-Message-State: AOJu0Yy95UaCkUdBy5JRpYcbNeecXdO3GxOvydN6v5AympJMvy0T3AI9
	5Ot6/n8I8ue4Ljngxdk8/9oZDj/8q7JNiA6IDaE=
X-Google-Smtp-Source: AGHT+IHx9eDarbPTGhFlRlrMZrUjj0C9/fRBqeQRfE6exoHoYzUvUicFz01LayrhuIRerOGpu2U2D9uwGjwIoB8Ox40=
X-Received: by 2002:a05:6214:5287:b0:67f:3f4f:82c9 with SMTP id
 kj7-20020a056214528700b0067f3f4f82c9mr4575429qvb.45.1702996001532; Tue, 19
 Dec 2023 06:26:41 -0800 (PST)
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
In-Reply-To: <c392f901-789a-42e2-8cf7-5e246365a1ca@broadcom.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Wed, 20 Dec 2023 01:26:30 +1100
Message-ID: <CAGRGNgW0h_uqHn0rKwGx0L41R+YgzgWPEh83kSKVCeqfCDeOug@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcmfmac: cfg80211: Use WSEC to set SAE password
To: Arend van Spriel <arend.vanspriel@broadcom.com>, Kalle Valo <kvalo@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Arend van Spriel <aspriel@gmail.com>, 
	Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, 
	Daniel Berlin <dberlin@dberlin.org>, linux-wireless@vger.kernel.org, 
	brcm80211-dev-list.pdl@broadcom.com, SHA-cyfmac-dev-list@infineon.com, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arend and Kalle,

On Wed, Dec 20, 2023 at 12:47=E2=80=AFAM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On 12/19/2023 12:01 PM, Hector Martin wrote:
> >
> >
> > On 2023/12/19 17:52, Arend Van Spriel wrote:
> >> On December 17, 2023 12:25:23 PM Kalle Valo <kvalo@kernel.org> wrote:
> >>
> >>> Hector Martin <marcan@marcan.st> wrote:
> >>>
> >>>> Using the WSEC command instead of sae_password seems to be the suppo=
rted
> >>>> mechanism on newer firmware, and also how the brcmdhd driver does it=
.
> >>>>
> >>>> According to user reports [1], the sae_password codepath doesn't act=
ually
> >>>> work on machines with Cypress chips anyway, so no harm in removing i=
t.
> >>>>
> >>>> This makes WPA3 work with iwd, or with wpa_supplicant pending a supp=
ort
> >>>> patchset [2].
> >>>>
> >>>> [1] https://rachelbythebay.com/w/2023/11/06/wpa3/
> >>>> [2] http://lists.infradead.org/pipermail/hostap/2023-July/041653.htm=
l
> >>>>
> >>>> Signed-off-by: Hector Martin <marcan@marcan.st>
> >>>> Reviewed-by: Neal Gompa <neal@gompa.dev>
> >>>
> >>> Arend, what do you think?
> >>>
> >>> We recently talked about people testing brcmfmac patches, has anyone =
else
> >>> tested this?
> >>
> >> Not sure I already replied so maybe I am repeating myself. I would pre=
fer
> >> to keep the Cypress sae_password path as well although it reportedly d=
oes
> >> not work. The vendor support in the driver can be used to accommodate =
for
> >> that. The other option would be to have people with Cypress chipset te=
st
> >> this patch. If that works for both we can consider dropping the
> >> sae_password path.
> >>
> >> Regards,
> >> Arend
> >
> > So, if nobody from Cypress chimes in ever, and nobody cares nor tests
> > Cypress chipsets, are we keeping any and all existing Cypress code-path=
s
> > as bitrotting code forever and adding gratuitous conditionals every tim=
e
> > any functionality needs to change "just in case it breaks Cypress" even
> > though it has been tested compatible on Broadcom chipsets/firmware?
> >
> > Because that's not sustainable long term.
>
> You should look into WEXT just for the fun of it. If it were up to me
> and a bunch of other people that would have been gone decades ago. Maybe
> a bad example if the sae_password is indeed not working, but the Cypress
> chipset is used in RPi3 and RPi4 so there must be a couple of users.

There are reports that WPA3 is broken on the Cypress chipsets the
Raspberry Pis are using and this patch fixes it:
https://rachelbythebay.com/w/2023/11/06/wpa3/

Based on that, it appears that all known users of WPA3 capable
hardware with this driver require this fix.

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
