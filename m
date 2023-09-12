Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5BF33D2
	for <asahi@lists.linux.dev>; Tue, 12 Sep 2023 22:47:37 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-52f3ba561d9so717585a12.1
        for <asahi@lists.linux.dev>; Tue, 12 Sep 2023 15:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694558855; x=1695163655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JPQmiOiJEVpUypTzrtCNWvG84b8X0egdVXAFfU36T2Y=;
        b=vY8S8W7B05iVY+dg3dERqrUOXFgdYezv1HyudbE5B6Ceg5gQfjNxeSCnPF6xLwUdi1
         0tlBla3fcP53hzi9sPecTuDXoUhy4LPg9G18w00qM0mkgMB67xmXBJhs8Zv08u3eWvDJ
         wOyiu3Db3m2QoxmVgga4aagGim/1vYyRb7KhViut33WUUXVrmZ4IgeIW/ohfXK2kZ0OO
         Zf+vtl4cLhcFNPd9IVHtG2sIc5Q4AptGrr4VRVI4QHhofsLar79YLYWK493VcBuUnyTz
         zQM/tStossWVEN9i3dPvzRxD/H/izJAm9p6IGedQ8syuSp0l0E316dVvlIEpYbmi8Qg/
         1kyQ==
X-Gm-Message-State: AOJu0YyRXlKkDXMhWKtq6YPLFM8zkOwYO1Xf5GAo2MuqVZajnfUwvSi5
	5wvaqW2BUX4BvD1jmv+U477JCJQbbuVvqx0o
X-Google-Smtp-Source: AGHT+IE+9/MOjVBSV0k869k2mLhKffsh6jbHmjzTw7ZVJxDXY906TPZMdRfkVE9UrDZQaRj/GNsn8Q==
X-Received: by 2002:a05:6402:2794:b0:52e:33ad:1c45 with SMTP id b20-20020a056402279400b0052e33ad1c45mr5592206ede.11.1694558854657;
        Tue, 12 Sep 2023 15:47:34 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id b7-20020aa7c6c7000000b0052328d4268asm6446691eds.81.2023.09.12.15.47.33
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 15:47:34 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9ad8d0be93aso74042866b.0
        for <asahi@lists.linux.dev>; Tue, 12 Sep 2023 15:47:33 -0700 (PDT)
X-Received: by 2002:a17:907:96a4:b0:9a5:c38d:6b75 with SMTP id
 hd36-20020a17090796a400b009a5c38d6b75mr5511540ejc.15.1694558853578; Tue, 12
 Sep 2023 15:47:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230912-simpledrm-multiple-power-domains-v2-1-01b66bfb1980@jannau.net>
In-Reply-To: <20230912-simpledrm-multiple-power-domains-v2-1-01b66bfb1980@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 12 Sep 2023 18:46:56 -0400
X-Gmail-Original-Message-ID: <CAEg-Je8i4P8r-5EUikS=6wy5_3OvufeLzfLWkB+SgMq-nkpArA@mail.gmail.com>
Message-ID: <CAEg-Je8i4P8r-5EUikS=6wy5_3OvufeLzfLWkB+SgMq-nkpArA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/simpledrm: Add support for multiple "power-domains"
To: j@jannau.net
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 4:22=E2=80=AFPM Janne Grunau via B4 Relay
<devnull+j.jannau.net@kernel.org> wrote:
>
> From: Janne Grunau <j@jannau.net>
>
> Multiple power domains need to be handled explicitly in each driver. The
> driver core can not handle it automatically since it is not aware of
> power sequencing requirements the hardware might have. This is not a
> problem for simpledrm since everything is expected to be powered on by
> the bootloader. simpledrm has just ensure it remains powered on during
> its lifetime.
> This is required on Apple silicon M2 and M2 Pro/Max/Ultra desktop
> systems. The HDMI output initialized by the bootloader requires keeping
> the display controller and a DP phy power domain on.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Changes in v2:
> - removed broken drm_err() log statement only ment for debugging
> - removed commented cast
> - use correct format spcifier for 'int' in log statement
> - add 'continue;' after failure to get device for power_domain
> - use drm_warn() in non fatal error cases
> - removed duplicate PTR_ERR conversion
> - Link to v1: https://lore.kernel.org/r/20230910-simpledrm-multiple-power=
-domains-v1-1-f8718aefc685@jannau.net
> ---
>  drivers/gpu/drm/tiny/simpledrm.c | 105 +++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 105 insertions(+)
>
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simp=
ledrm.c
> index ff86ba1ae1b8..9c597461d1e2 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -6,6 +6,7 @@
>  #include <linux/of_address.h>
>  #include <linux/platform_data/simplefb.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/regulator/consumer.h>
>
>  #include <drm/drm_aperture.h>
> @@ -227,6 +228,12 @@ struct simpledrm_device {
>         unsigned int regulator_count;
>         struct regulator **regulators;
>  #endif
> +       /* power-domains */
> +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
> +       int pwr_dom_count;
> +       struct device **pwr_dom_devs;
> +       struct device_link **pwr_dom_links;
> +#endif
>
>         /* simplefb settings */
>         struct drm_display_mode mode;
> @@ -468,6 +475,101 @@ static int simpledrm_device_init_regulators(struct =
simpledrm_device *sdev)
>  }
>  #endif
>
> +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
> +/*
> + * Generic power domain handling code.
> + *
> + * Here we handle the power-domains properties of our "simple-framebuffe=
r"
> + * dt node. This is only necessary if there is more than one power-domai=
n.
> + * A single power-domains is handled automatically by the driver core. M=
ultiple
> + * power-domains have to be handled by drivers since the driver core can=
't know
> + * the correct power sequencing. Power sequencing is not an issue for si=
mpledrm
> + * since the bootloader has put the power domains already in the correct=
 state.
> + * simpledrm has only to ensure they remain active for its lifetime.
> + *
> + * When the driver unloads, we detach from the power-domains.
> + *
> + * We only complain about errors here, no action is taken as the most li=
kely
> + * error can only happen due to a mismatch between the bootloader which =
set
> + * up the "simple-framebuffer" dt node, and the PM domain providers in t=
he
> + * device tree. Chances are that there are no adverse effects, and if th=
ere are,
> + * a clean teardown of the fb probe will not help us much either. So jus=
t
> + * complain and carry on, and hope that the user actually gets a working=
 fb at
> + * the end of things.
> + */
> +static void simpledrm_device_detach_genpd(void *res)
> +{
> +       int i;
> +       struct simpledrm_device *sdev =3D res;
> +
> +       if (sdev->pwr_dom_count <=3D 1)
> +               return;
> +
> +       for (i =3D sdev->pwr_dom_count - 1; i >=3D 0; i--) {
> +               if (!sdev->pwr_dom_links[i])
> +                       device_link_del(sdev->pwr_dom_links[i]);
> +               if (!IS_ERR_OR_NULL(sdev->pwr_dom_devs[i]))
> +                       dev_pm_domain_detach(sdev->pwr_dom_devs[i], true)=
;
> +       }
> +}
> +
> +static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev)
> +{
> +       struct device *dev =3D sdev->dev.dev;
> +       int i;
> +
> +       sdev->pwr_dom_count =3D of_count_phandle_with_args(dev->of_node, =
"power-domains",
> +                                                        "#power-domain-c=
ells");
> +       /*
> +        * Single power-domain devices are handled by driver core nothing=
 to do
> +        * here. The same for device nodes without "power-domains" proper=
ty.
> +        */
> +       if (sdev->pwr_dom_count <=3D 1)
> +               return 0;
> +
> +       sdev->pwr_dom_devs =3D devm_kcalloc(dev, sdev->pwr_dom_count,
> +                                              sizeof(*sdev->pwr_dom_devs=
),
> +                                              GFP_KERNEL);
> +       if (!sdev->pwr_dom_devs)
> +               return -ENOMEM;
> +
> +       sdev->pwr_dom_links =3D devm_kcalloc(dev, sdev->pwr_dom_count,
> +                                               sizeof(*sdev->pwr_dom_lin=
ks),
> +                                               GFP_KERNEL);
> +       if (!sdev->pwr_dom_links)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < sdev->pwr_dom_count; i++) {
> +               sdev->pwr_dom_devs[i] =3D dev_pm_domain_attach_by_id(dev,=
 i);
> +               if (IS_ERR(sdev->pwr_dom_devs[i])) {
> +                       int ret =3D PTR_ERR(sdev->pwr_dom_devs[i]);
> +                       if (ret =3D=3D -EPROBE_DEFER) {
> +                               simpledrm_device_detach_genpd(sdev);
> +                               return ret;
> +                       }
> +                       drm_warn(&sdev->dev,
> +                                "pm_domain_attach_by_id(%u) failed: %d\n=
", i, ret);
> +                       continue;
> +               }
> +
> +               sdev->pwr_dom_links[i] =3D device_link_add(dev,
> +                                                        sdev->pwr_dom_de=
vs[i],
> +                                                        DL_FLAG_STATELES=
S |
> +                                                        DL_FLAG_PM_RUNTI=
ME |
> +                                                        DL_FLAG_RPM_ACTI=
VE);
> +               if (!sdev->pwr_dom_links[i])
> +                       drm_warn(&sdev->dev, "failed to link power-domain=
 %d\n", i);
> +       }
> +
> +       return devm_add_action_or_reset(dev, simpledrm_device_detach_genp=
d, sdev);
> +}
> +#else
> +static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev)
> +{
> +       return 0;
> +}
> +#endif
> +
>  /*
>   * Modesetting
>   */
> @@ -651,6 +753,9 @@ static struct simpledrm_device *simpledrm_device_crea=
te(struct drm_driver *drv,
>         if (ret)
>                 return ERR_PTR(ret);
>         ret =3D simpledrm_device_init_regulators(sdev);
> +       if (ret)
> +               return ERR_PTR(ret);
> +       ret =3D simpledrm_device_attach_genpd(sdev);
>         if (ret)
>                 return ERR_PTR(ret);
>
>
> ---
> base-commit: 15d30b46573d75f5cb58cfacded8ebab9c76a2b0
> change-id: 20230910-simpledrm-multiple-power-domains-f41efa6ad9bc
>
> Best regards,
> --
> Janne Grunau <j@jannau.net>
>
>

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
