Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEB96D38
	for <asahi@lists.linux.dev>; Tue, 26 Sep 2023 07:32:28 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-59f55c276c3so65551857b3.2
        for <asahi@lists.linux.dev>; Tue, 26 Sep 2023 00:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695713547; x=1696318347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=laJcIFxy0JToS9GpnmSBInlVg5g0YUWZWpaVsSmKGfk=;
        b=rS+J0vI7IhPX5J7pR+69ZRobX13qJPBRdPDA5CMm14Q9l0+kztTQXNsQBWRCxwjDPj
         2HdqS12cyZdfriH7s47L6NJxFYnIMLSXUu6f32qac8dhi1BytQIr+55wxmI0X+YJ9jHY
         6lRjQoXBTOcXt65T88MvItSQhe9lWx2U0PqBuRc9FuDWswDbsfH4ZGxPa3KAc2E/RuQK
         8mdc3UEecukBReEjbs9dkkmIDyDMDoZac0nLcGwfUaW+CZP0Bvao0MqHWL1e3mVoHGo5
         ZPngONL38p5ht0B4CIqYh8Nspe3gK+681RRvRljKLrCEJ5FMspmgNN64UH+m7vM+xszT
         B4Gg==
X-Gm-Message-State: AOJu0YxP8g1pMBBIxT+V0qbdsD1yxYFgJRFiyx+YqeCuOvTCsbFJWnWQ
	lRkLaO8UQ/hMtEEFcbv8481qszOjycrxVA==
X-Google-Smtp-Source: AGHT+IHzHiZfAIhwz7ZADMUqg34Qj2Dy94TCjrrhemipFpUATEQqgaxbNrYhnN1hJxOCdZsHaTkN0w==
X-Received: by 2002:a81:4428:0:b0:59f:9c08:8f12 with SMTP id r40-20020a814428000000b0059f9c088f12mr4467389ywa.38.1695713547431;
        Tue, 26 Sep 2023 00:32:27 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id x9-20020a81af49000000b0059f802fad40sm923128ywj.22.2023.09.26.00.32.26
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 00:32:26 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-59f82ad1e09so38188577b3.0
        for <asahi@lists.linux.dev>; Tue, 26 Sep 2023 00:32:26 -0700 (PDT)
X-Received: by 2002:a81:4ed1:0:b0:59c:a68:d36b with SMTP id
 c200-20020a814ed1000000b0059c0a68d36bmr9368709ywb.20.1695713546672; Tue, 26
 Sep 2023 00:32:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230912-simpledrm-multiple-power-domains-v2-1-01b66bfb1980@jannau.net>
 <ff8e4a01-9a58-45bf-a743-08f4f6027251@suse.de>
In-Reply-To: <ff8e4a01-9a58-45bf-a743-08f4f6027251@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Sep 2023 09:32:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9Ahp2ACYfRbnnnMbn9Cps939uwCQM+Md_PcCKYG=piw@mail.gmail.com>
Message-ID: <CAMuHMdV9Ahp2ACYfRbnnnMbn9Cps939uwCQM+Md_PcCKYG=piw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/simpledrm: Add support for multiple "power-domains"
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: j@jannau.net, Javier Martinez Canillas <javierm@redhat.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC genpd

On Mon, Sep 18, 2023 at 10:24=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
> Am 12.09.23 um 22:22 schrieb Janne Grunau via B4 Relay:
> > From: Janne Grunau <j@jannau.net>
> >
> > Multiple power domains need to be handled explicitly in each driver. Th=
e
> > driver core can not handle it automatically since it is not aware of
> > power sequencing requirements the hardware might have. This is not a
> > problem for simpledrm since everything is expected to be powered on by
> > the bootloader. simpledrm has just ensure it remains powered on during
> > its lifetime.
> > This is required on Apple silicon M2 and M2 Pro/Max/Ultra desktop
> > systems. The HDMI output initialized by the bootloader requires keeping
> > the display controller and a DP phy power domain on.
> >
> > Signed-off-by: Janne Grunau <j@jannau.net>

Thanks for your patch, which is now commit 61df9ca231075e70
("drm/simpledrm: Add support for multiple "power-domains"") in
drm-misc/for-linux-next.

> As a simpledrm patch:
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Do you want to wait for another review from  someone with
> power-management expertise?

Yeah, why not? Let's CC them, so they become aware...

> Do we need a similar patch for ofdrm?
>
> Best regards
> Thomas
>
> > ---
> > Changes in v2:
> > - removed broken drm_err() log statement only ment for debugging
> > - removed commented cast
> > - use correct format spcifier for 'int' in log statement
> > - add 'continue;' after failure to get device for power_domain
> > - use drm_warn() in non fatal error cases
> > - removed duplicate PTR_ERR conversion
> > - Link to v1: https://lore.kernel.org/r/20230910-simpledrm-multiple-pow=
er-domains-v1-1-f8718aefc685@jannau.net
> > ---
> >   drivers/gpu/drm/tiny/simpledrm.c | 105 ++++++++++++++++++++++++++++++=
+++++++++
> >   1 file changed, 105 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/si=
mpledrm.c
> > index ff86ba1ae1b8..9c597461d1e2 100644
> > --- a/drivers/gpu/drm/tiny/simpledrm.c
> > +++ b/drivers/gpu/drm/tiny/simpledrm.c
> > @@ -6,6 +6,7 @@
> >   #include <linux/of_address.h>
> >   #include <linux/platform_data/simplefb.h>
> >   #include <linux/platform_device.h>
> > +#include <linux/pm_domain.h>
> >   #include <linux/regulator/consumer.h>
> >
> >   #include <drm/drm_aperture.h>
> > @@ -227,6 +228,12 @@ struct simpledrm_device {
> >       unsigned int regulator_count;
> >       struct regulator **regulators;
> >   #endif
> > +     /* power-domains */
> > +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
> > +     int pwr_dom_count;
> > +     struct device **pwr_dom_devs;
> > +     struct device_link **pwr_dom_links;
> > +#endif
> >
> >       /* simplefb settings */
> >       struct drm_display_mode mode;
> > @@ -468,6 +475,101 @@ static int simpledrm_device_init_regulators(struc=
t simpledrm_device *sdev)
> >   }
> >   #endif
> >
> > +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
> > +/*
> > + * Generic power domain handling code.
> > + *
> > + * Here we handle the power-domains properties of our "simple-framebuf=
fer"
> > + * dt node. This is only necessary if there is more than one power-dom=
ain.
> > + * A single power-domains is handled automatically by the driver core.=
 Multiple
> > + * power-domains have to be handled by drivers since the driver core c=
an't know
> > + * the correct power sequencing. Power sequencing is not an issue for =
simpledrm
> > + * since the bootloader has put the power domains already in the corre=
ct state.
> > + * simpledrm has only to ensure they remain active for its lifetime.
> > + *
> > + * When the driver unloads, we detach from the power-domains.
> > + *
> > + * We only complain about errors here, no action is taken as the most =
likely
> > + * error can only happen due to a mismatch between the bootloader whic=
h set
> > + * up the "simple-framebuffer" dt node, and the PM domain providers in=
 the
> > + * device tree. Chances are that there are no adverse effects, and if =
there are,
> > + * a clean teardown of the fb probe will not help us much either. So j=
ust
> > + * complain and carry on, and hope that the user actually gets a worki=
ng fb at
> > + * the end of things.
> > + */
> > +static void simpledrm_device_detach_genpd(void *res)
> > +{
> > +     int i;
> > +     struct simpledrm_device *sdev =3D res;
> > +
> > +     if (sdev->pwr_dom_count <=3D 1)
> > +             return;
> > +
> > +     for (i =3D sdev->pwr_dom_count - 1; i >=3D 0; i--) {
> > +             if (!sdev->pwr_dom_links[i])
> > +                     device_link_del(sdev->pwr_dom_links[i]);
> > +             if (!IS_ERR_OR_NULL(sdev->pwr_dom_devs[i]))
> > +                     dev_pm_domain_detach(sdev->pwr_dom_devs[i], true)=
;
> > +     }
> > +}
> > +
> > +static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev=
)
> > +{
> > +     struct device *dev =3D sdev->dev.dev;
> > +     int i;
> > +
> > +     sdev->pwr_dom_count =3D of_count_phandle_with_args(dev->of_node, =
"power-domains",
> > +                                                      "#power-domain-c=
ells");
> > +     /*
> > +      * Single power-domain devices are handled by driver core nothing=
 to do
> > +      * here. The same for device nodes without "power-domains" proper=
ty.
> > +      */
> > +     if (sdev->pwr_dom_count <=3D 1)
> > +             return 0;
> > +
> > +     sdev->pwr_dom_devs =3D devm_kcalloc(dev, sdev->pwr_dom_count,
> > +                                            sizeof(*sdev->pwr_dom_devs=
),
> > +                                            GFP_KERNEL);
> > +     if (!sdev->pwr_dom_devs)
> > +             return -ENOMEM;
> > +
> > +     sdev->pwr_dom_links =3D devm_kcalloc(dev, sdev->pwr_dom_count,
> > +                                             sizeof(*sdev->pwr_dom_lin=
ks),
> > +                                             GFP_KERNEL);
> > +     if (!sdev->pwr_dom_links)
> > +             return -ENOMEM;
> > +
> > +     for (i =3D 0; i < sdev->pwr_dom_count; i++) {
> > +             sdev->pwr_dom_devs[i] =3D dev_pm_domain_attach_by_id(dev,=
 i);
> > +             if (IS_ERR(sdev->pwr_dom_devs[i])) {
> > +                     int ret =3D PTR_ERR(sdev->pwr_dom_devs[i]);
> > +                     if (ret =3D=3D -EPROBE_DEFER) {
> > +                             simpledrm_device_detach_genpd(sdev);
> > +                             return ret;
> > +                     }
> > +                     drm_warn(&sdev->dev,
> > +                              "pm_domain_attach_by_id(%u) failed: %d\n=
", i, ret);
> > +                     continue;
> > +             }
> > +
> > +             sdev->pwr_dom_links[i] =3D device_link_add(dev,
> > +                                                      sdev->pwr_dom_de=
vs[i],
> > +                                                      DL_FLAG_STATELES=
S |
> > +                                                      DL_FLAG_PM_RUNTI=
ME |
> > +                                                      DL_FLAG_RPM_ACTI=
VE);
> > +             if (!sdev->pwr_dom_links[i])
> > +                     drm_warn(&sdev->dev, "failed to link power-domain=
 %d\n", i);
> > +     }
> > +
> > +     return devm_add_action_or_reset(dev, simpledrm_device_detach_genp=
d, sdev);
> > +}
> > +#else
> > +static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev=
)
> > +{
> > +     return 0;
> > +}
> > +#endif
> > +
> >   /*
> >    * Modesetting
> >    */
> > @@ -651,6 +753,9 @@ static struct simpledrm_device *simpledrm_device_cr=
eate(struct drm_driver *drv,
> >       if (ret)
> >               return ERR_PTR(ret);
> >       ret =3D simpledrm_device_init_regulators(sdev);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +     ret =3D simpledrm_device_attach_genpd(sdev);
> >       if (ret)
> >               return ERR_PTR(ret);
> >
> >
> > ---
> > base-commit: 15d30b46573d75f5cb58cfacded8ebab9c76a2b0
> > change-id: 20230910-simpledrm-multiple-power-domains-f41efa6ad9bc

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
