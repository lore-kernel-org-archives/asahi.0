Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9C03C35
	for <asahi@lists.linux.dev>; Mon,  5 Sep 2022 09:55:12 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-3452214cec6so23433317b3.1
        for <asahi@lists.linux.dev>; Mon, 05 Sep 2022 02:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=kZwowG+rRON5KFSUE0R9YJYWgBrkd2+kJINr3ZwEXZo=;
        b=Vl1e3lhr4VBYOH0566THbq5E7P+PDrFu12F8dop24wzAOHlXYdtoS44xu2rgMicuvp
         tA7YB486fFdpf8kVtFpNecJH1s4DXPlxHiW6LQkPh/LWtoRWVE5AHVHmq0SZwgAi87o9
         wEXwyzgeEiMe9khhpJkOsw2zjnF+351IkAyQj1AQodm19bxNYQTuw2r3ZRJi19DQ8Rtx
         3Om79/0Ta7Gr6MSxgSucqk93FAlG0v0w89dq18ngW9nbBb1AX7Z+BV6kOoLnB8YYNiK3
         nKw+MnTtefiAlqU/F83VERFQTnah38RoRnpml3JJpVMCKDt8aMbdYtZDFbs1AYhOw90P
         JVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kZwowG+rRON5KFSUE0R9YJYWgBrkd2+kJINr3ZwEXZo=;
        b=Jr2+gpFGtHt5WJgMJ7W2v6QXlg3lY1HCAvuGgiD7TmYvZUVX/FQWdLb1HtOj+XlCjk
         Vcl1nWbqf4z0RvuXe9ZLUfgypFylxKkt4R4F6e3FrMGgrqboXrr6g4+HZviwWq1V0739
         5XXKm2OWg82qNQVrDo30wqCXqegxgnRCwlaqivHlg2HxhKGXpY1wp5I1MK/ovmHnCfMq
         x1K9V0tMXY69FZ1KYpDp6sCaBYpp8BvvGIMn1bHDrs+nA/FvKVOJZfDlhZCWdDhQD9Ih
         IVjviNf5i5KeXHzi7chxOsFp0VdZhQd5c2aX2P/9giHonz7nBSTDOfOPUJAKzkXfK1ZR
         FX3g==
X-Gm-Message-State: ACgBeo0/zJ6AfYmxhaMSJWrGDgO9bWuaMZ8vvCWfG3lv88YbHw1dhob+
	MRKEReLXohM/QnWz9VmNBALVz76CrGVBaRhuOdHpsQLt
X-Google-Smtp-Source: AA6agR5VnQe4agp3+bventbZ7vQ9gI0u6eIpSo3fWiJh/oMJA6ijI89J9YKmciXOJw3L4bSRSWRikz9lWxdlZfz3zGk=
X-Received: by 2002:a0d:f701:0:b0:32a:17d3:d189 with SMTP id
 h1-20020a0df701000000b0032a17d3d189mr38205702ywf.401.1662371711515; Mon, 05
 Sep 2022 02:55:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220905093546.19735-1-lukas.bulwahn@gmail.com> <4DB82E66-0BB9-4B43-917B-55E115994876@cutebit.org>
In-Reply-To: <4DB82E66-0BB9-4B43-917B-55E115994876@cutebit.org>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 5 Sep 2022 11:55:00 +0200
Message-ID: <CAKXUXMzGJv=Xvbv8VRqFfa=n-0D84Hk2FALqtyqmxD9ovDKCMw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: rectify entry in ARM/APPLE MACHINE SOUND DRIVERS
To: =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Mark Brown <broonie@kernel.org>, asahi@lists.linux.dev, alsa-devel@alsa-project.org, 
	kernel-janitors <kernel-janitors@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 5, 2022 at 11:44 AM Martin Povi=C5=A1er <povik+lin@cutebit.org>=
 wrote:
>
>
> > On 5. 9. 2022, at 11:35, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > Commit 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver") add=
s
> > a new sound driver at the location "sound/soc/apple/", but it adds a fi=
le
> > entry referring to the non-existing location "drivers/sound/apple/*".
> >
> > Hence, ./scripts/get_maintainer.pl --self-test=3Dpatterns complains abo=
ut a
> > broken reference.
> >
> > Repair this file reference in ARM/APPLE MACHINE SOUND DRIVERS.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > Martin, please ack.
> > Mark, please pick this patch on top of the commit above.
>
> Hi Lukas, fixed here already:
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/=
?id=3D55e2bd9c41e800638676dce3f19dcfd16b309a08
>

Great, thanks! Then, there is nothing more to do. Please ignore this patch =
then.

Lukas
