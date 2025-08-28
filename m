Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B8F2676D9
	for <asahi@lists.linux.dev>; Thu, 28 Aug 2025 22:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756419589; cv=none; b=ecdnFaiZZx0ASOa8U5nJN/gRxD/Vu0Y/NKK5XlItSqJuJe7bgf3CNWyaj1c73WwPSVbs2PC2Y49zN+fqzpFvYqtgHxGrnGvA0z5MySInNJSlgNgDNaCbAX7bEJRksBvUMF28ApiFkCCB0TEj/3IvBlXAyB8TFPq7R9bX3om88+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756419589; c=relaxed/simple;
	bh=4tuZrNLlp0O3w2YPz2N6H/AzI9/WEF37YyRhWt9LYj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdHCwWCwSDWyV1IyrkzRQ6RT/wH4F1EtTGXYjgggiiJWeVTPG514bXXAimYaUzCXbG6iFWy1rNj0oFtoAMmfUsrOjqX3wGOh881UOuLCjnViQtKYVucEsOrcyzzE8qMKsZYNr/zAWqlqIaO7AyY55rew7cFir3Ma9mmhnXu4Ub8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXKP442G; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXKP442G"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b47175d02dcso1252326a12.3
        for <asahi@lists.linux.dev>; Thu, 28 Aug 2025 15:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756419586; x=1757024386; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8HPaW6RU4iCmnankjCaedpur2XP8Ivp7Piq/1BRzh9U=;
        b=MXKP442GGV5ny1npTG0JxKSUUan3VYwuXSm3Ca3Altx/jSqJ+nrCXc7GrQ8G2nk+o/
         QSIuN7qrafNVUUFccz5YmbXRNsbq0TFQtwR30lvNfi0RBc4bvR1njNSiBhIAeNFg7MtW
         PL/pE3jWkml4Tmbx5f8RJOIA3iSadYUAzfAYhoisNIDLFNgd+/Sf3NnXzif8e7+PoP/A
         5E08tiHBSaKLKsWtj+J/tiL1XOPIVLg98Zl2CL3qRZh4JfYQZjSQOyWwKJdlwV6ylTk7
         gp6kWXPj1ojL2g1Er3DDWTe2kFLmQfesk4BKPsQtteTJKdTdpC7pFvfokmW0uixTDUDU
         +GOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756419586; x=1757024386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8HPaW6RU4iCmnankjCaedpur2XP8Ivp7Piq/1BRzh9U=;
        b=q2m+LizO9rph5JPUpvVWkZCcyc36Ar7spk0teFDOJhWFtGYn2B3IVmF9oIqw63eBPt
         H0syOJgVOOyPpayQrhw4KynVWl7FSpAT/86uRy7/UaFCmy/AmI86dgB2RYf/76npb5Hk
         xfZJ+B5Eyd0NXNdnWEoF8tfHpu6mCoQLgZAeqUmi8pD4Dt28MhvbA3AJnbu7sM08hhxl
         7UpTafHPWS6EcBwehTrdIXjsESbzufyQhro4669VLWr+5zQIdAmtMYzvegGIoONigjlH
         LXGxfva3di9b3tvA21H0+848O43WMLrdakrRw6j11C1EsuX6zF53TnquMhh+mZ2NH3b5
         WOjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZEARNDP6WbZGAdY35s4rFTO4ZzN+zaVIK3Cx4Eq8mwy6UH5WNNNTgwxWZ0W4dy4pxquTa5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFbxP5JOLbW8auTph3Pp37I0syruqTHMkEd0f8WLkMT6awLsE4
	x2L2lwaOX7YKGcsg2MRibl4nDzZWj1sn25Z4tCdpmd2zHNDY9lqkuQ0u
X-Gm-Gg: ASbGnctJ+QNa9Us33/A8DH0ZExxUaGWRaSWcqVjAKnpVfnc/sZukIAP8P8IIYhXsL1L
	FVNhTPxGuT/gd2B8iLbPLqJQRGqQjw+YLXy2e5nwoVXIyX8+jY5TpES/5u0ZLLZuCu6jzVbVjhO
	n97mukywLGOrXD470N5zjxW14oxpkqSwsRe9dGlOC89qLEVzFa/H+dTz1QSCL8e96oZ8s5FjYxk
	ufpO/HJhEkzvbBKTm2XqLfB/5/z7KMlfBu5NLz1Czni0S0yOIbwEp/czweSGVLlQ5b9l+KP9cYI
	g3U4ueKun3ibOxDSFyXTv+l6IEH1lDPz2oWAJ/V/b60Ra5Gi66wkEDqG8rSt6h64BlE/de90oX0
	RmOGo/RXvRCxQgd/u8N0JXmxKK4trn5843lFDU6avBm61FQ==
X-Google-Smtp-Source: AGHT+IEGFZ4UDorN609Gb6R77LxzBJ8Win5+noW9UcU72XIbpnXa4dkrRACID13foY34tx2FJu6wMA==
X-Received: by 2002:a17:902:e5c5:b0:248:ef1f:bbbe with SMTP id d9443c01a7336-248ef1fbf53mr39129085ad.0.1756419586061;
        Thu, 28 Aug 2025 15:19:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249066e042asm5390145ad.146.2025.08.28.15.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 15:19:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 28 Aug 2025 15:19:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 05/11] hwmon: Add Apple Silicon SMC hwmon driver
Message-ID: <e077b9af-62b4-45c7-b348-a9c64e47b7e7@roeck-us.net>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <20250827-macsmc-subdevs-v2-5-ce5e99d54c28@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-macsmc-subdevs-v2-5-ce5e99d54c28@gmail.com>

On Wed, Aug 27, 2025 at 09:22:39PM +1000, James Calligeros wrote:
> The System Management Controller on Apple Silicon devices is responsible
> for integrating and exposing the data reported by the vast array of
> hardware monitoring sensors present on these devices. It is also
> responsible for fan control, and allows users to manually set fan
> speeds if they so desire. Add a hwmon driver to expose current,
> power, temperature, and voltage monitoring sensors, as well as
> fan speed monitoring and control via the SMC on Apple Silicon devices.
> 
> The SMC firmware has no consistency between devices, even when they
> share an SoC. The FourCC keys used to access sensors are almost
> random. An M1 Mac mini will have different FourCCs for its CPU core
> temperature sensors to an M1 MacBook Pro, for example. For this
> reason, the valid sensors for a given device are specified in a
> child of the SMC Devicetree node. The driver uses this information
> to determine which sensors to make available at runtime.
> 
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  MAINTAINERS                  |   1 +
>  drivers/hwmon/Kconfig        |  12 +
>  drivers/hwmon/Makefile       |   1 +
>  drivers/hwmon/macsmc_hwmon.c | 848 +++++++++++++++++++++++++

Documentation/hwmon/macsmc_hwmon missing

>  4 files changed, 862 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5d53d243dc9abdf1db5865f8e6bcddbac3eafebe..2eb23522654dd050262eb06e077587030cc335aa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2408,6 +2408,7 @@ F:	drivers/clk/clk-apple-nco.c
>  F:	drivers/cpufreq/apple-soc-cpufreq.c
>  F:	drivers/dma/apple-admac.c
>  F:	drivers/gpio/gpio-macsmc.c
> +F:	drivers/hwmon/macsmc_hwmon.c
>  F:	drivers/pmdomain/apple/
>  F:	drivers/i2c/busses/i2c-pasemi-core.c
>  F:	drivers/i2c/busses/i2c-pasemi-platform.c
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 9d28fcf7cd2a6f9e2f54694a717bd85ff4047b46..1ca6db71e4d9da32717fd14487c10944433ada41 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1164,6 +1164,18 @@ config SENSORS_LTQ_CPUTEMP
>  	  If you say yes here you get support for the temperature
>  	  sensor inside your CPU.
>  
> +config SENSORS_MACSMC_HWMON
> +	tristate "Apple SMC (Apple Silicon)"
> +	depends on MFD_MACSMC && OF
> +	help
> +	  This driver enables hwmon support for current, power, temperature,
> +	  and voltage sensors, as well as fan speed reporting and control
> +	  on Apple Silicon devices. Say Y here if you have an Apple Silicon
> +	  device.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called macsmc_hwmon.
> +
>  config SENSORS_MAX1111
>  	tristate "Maxim MAX1111 Serial 8-bit ADC chip and compatibles"
>  	depends on SPI_MASTER
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index cd8bc4752b4dbf015c6eb46157626f4e8f87dfae..80fc8447aff15b3b8e8583dc755c8accb3b6a93e 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -147,6 +147,7 @@ obj-$(CONFIG_SENSORS_LTC4260)	+= ltc4260.o
>  obj-$(CONFIG_SENSORS_LTC4261)	+= ltc4261.o
>  obj-$(CONFIG_SENSORS_LTC4282)	+= ltc4282.o
>  obj-$(CONFIG_SENSORS_LTQ_CPUTEMP) += ltq-cputemp.o
> +obj-$(CONFIG_SENSORS_MACSMC_HWMON)	+= macsmc_hwmon.o
>  obj-$(CONFIG_SENSORS_MAX1111)	+= max1111.o
>  obj-$(CONFIG_SENSORS_MAX127)	+= max127.o
>  obj-$(CONFIG_SENSORS_MAX16065)	+= max16065.o
> diff --git a/drivers/hwmon/macsmc_hwmon.c b/drivers/hwmon/macsmc_hwmon.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..e44ea357870238aa0b38d7b674a6c456271fdf0c
> --- /dev/null
> +++ b/drivers/hwmon/macsmc_hwmon.c
> @@ -0,0 +1,848 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Apple SMC hwmon driver for Apple Silicon platforms
> + *
> + * The System Management Controller on Apple Silicon devices is responsible for
> + * measuring data from sensors across the SoC and machine. These include power,
> + * temperature, voltage and current sensors. Some "sensors" actually expose
> + * derived values. An example of this is the key PHPC, which is an estimate
> + * of the heat energy being dissipated by the SoC.
> + *
> + * While each SoC only has one SMC variant, each platform exposes a different
> + * set of sensors. For example, M1 MacBooks expose battery telemetry sensors
> + * which are not present on the M1 Mac mini. For this reason, the available
> + * sensors for a given platform are described in the device tree in a child
> + * node of the SMC device. We must walk this list of available sensors and
> + * populate the required hwmon data structures at runtime.
> + *
> + * Originally based on a concept by Jean-Francois Bortolotti <jeff@borto.fr>
> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>

Unnecessary include file

> +#include <linux/mfd/macsmc.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#define MAX_LABEL_LENGTH	32
> +#define NUM_SENSOR_TYPES	5 /* temp, volt, current, power, fan */
> +
> +#define FLT_EXP_BIAS	127
> +#define FLT_EXP_MASK	GENMASK(30, 23)
> +#define FLT_MANT_BIAS	23
> +#define FLT_MANT_MASK	GENMASK(22, 0)
> +#define FLT_SIGN_MASK	BIT(31)
> +
> +static bool fan_control;
> +module_param_unsafe(fan_control, bool, 0644);
> +MODULE_PARM_DESC(fan_control,
> +		 "Override the SMC to set your own fan speeds on supported machines");
> +
> +struct macsmc_hwmon_sensor {
> +	struct apple_smc_key_info info;
> +	smc_key macsmc_key;
> +	char label[MAX_LABEL_LENGTH];
> +};
> +
> +struct macsmc_hwmon_fan {
> +	struct macsmc_hwmon_sensor now;
> +	struct macsmc_hwmon_sensor min;
> +	struct macsmc_hwmon_sensor max;
> +	struct macsmc_hwmon_sensor set;
> +	struct macsmc_hwmon_sensor mode;
> +	char label[MAX_LABEL_LENGTH];
> +	u32 attrs;
> +	bool manual;
> +};
> +
> +struct macsmc_hwmon_sensors {
> +	struct hwmon_channel_info channel_info;
> +	struct macsmc_hwmon_sensor *sensors;
> +	u32 count;
> +};
> +
> +struct macsmc_hwmon_fans {
> +	struct hwmon_channel_info channel_info;
> +	struct macsmc_hwmon_fan *fans;
> +	u32 count;
> +};
> +
> +struct macsmc_hwmon {
> +	struct device *dev;
> +	struct apple_smc *smc;
> +	struct device *hwmon_dev;
> +	struct hwmon_chip_info chip_info;
> +	/* Chip + sensor types + NULL */
> +	const struct hwmon_channel_info *channel_infos[1 + NUM_SENSOR_TYPES + 1];
> +	struct macsmc_hwmon_sensors temp;
> +	struct macsmc_hwmon_sensors volt;
> +	struct macsmc_hwmon_sensors curr;
> +	struct macsmc_hwmon_sensors power;
> +	struct macsmc_hwmon_fans fan;
> +};
> +
> +static int macsmc_hwmon_read_label(struct device *dev,
> +				   enum hwmon_sensor_types type, u32 attr,
> +				   int channel, const char **str)
> +{
> +	struct macsmc_hwmon *hwmon = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		if (channel >= hwmon->temp.count)
> +			return -EINVAL;

Wrong. Such channels should not be instantiated. It is completely
unacceptable for the "sensors" command to report such errors.
Also more below on the use of -EINVAL when readin values.

> +		*str = hwmon->temp.sensors[channel].label;
> +		break;
> +	case hwmon_in:
> +		if (channel >= hwmon->volt.count)
> +			return -EINVAL;
> +		*str = hwmon->volt.sensors[channel].label;
> +		break;
> +	case hwmon_curr:
> +		if (channel >= hwmon->curr.count)
> +			return -EINVAL;
> +		*str = hwmon->curr.sensors[channel].label;
> +		break;
> +	case hwmon_power:
> +		if (channel >= hwmon->power.count)
> +			return -EINVAL;
> +		*str = hwmon->power.sensors[channel].label;
> +		break;
> +	case hwmon_fan:
> +		if (channel >= hwmon->fan.count)
> +			return -EINVAL;
> +		*str = hwmon->fan.fans[channel].label;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * A number of sensors report data in a 48.16 fixed-point decimal format that is
> + * not used by any other function of the SMC.
> + */
> +static int macsmc_hwmon_read_ioft_scaled(struct apple_smc *smc, smc_key key,
> +					 u64 *p, int scale)
> +{
> +	u64 val;
> +	int ret;
> +
> +	ret = apple_smc_read_u64(smc, key, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	*p = mult_frac(val, scale, 65536);
> +
> +	return 0;
> +}
> +
> +/*
> + * Many sensors report their data as IEEE-754 floats. No other SMC function uses
> + * them.
> + */
> +static int macsmc_hwmon_read_f32_scaled(struct apple_smc *smc, smc_key key,
> +					int *p, int scale)
> +{
> +	u32 fval;
> +	u64 val;
> +	int ret, exp;
> +
> +	ret = apple_smc_read_u32(smc, key, &fval);
> +	if (ret < 0)
> +		return ret;
> +
> +	val = ((u64)((fval & FLT_MANT_MASK) | BIT(23)));
> +	exp = ((fval >> 23) & 0xff) - FLT_EXP_BIAS - FLT_MANT_BIAS;
> +	if (scale < 0) {
> +		val <<= 32;
> +		exp -= 32;
> +		val /= -scale;
> +	} else {
> +		val *= scale;
> +	}
> +
> +	if (exp > 63)
> +		val = U64_MAX;
> +	else if (exp < -63)
> +		val = 0;
> +	else if (exp < 0)
> +		val >>= -exp;
> +	else if (exp != 0 && (val & ~((1UL << (64 - exp)) - 1))) /* overflow */
> +		val = U64_MAX;
> +	else
> +		val <<= exp;
> +
> +	if (fval & FLT_SIGN_MASK) {
> +		if (val > (-(s64)INT_MIN))
> +			*p = INT_MIN;
> +		else
> +			*p = -val;
> +	} else {
> +		if (val > INT_MAX)
> +			*p = INT_MAX;
> +		else
> +			*p = val;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * The SMC has keys of multiple types, denoted by a FourCC of the same format
> + * as the key ID. We don't know what data type a key encodes until we poke at it.
> + */
> +static int macsmc_hwmon_read_key(struct apple_smc *smc,
> +				 struct macsmc_hwmon_sensor *sensor, int scale,
> +				 long *val)
> +{
> +	int ret;
> +
> +	switch (sensor->info.type_code) {
> +	/* 32-bit IEEE 754 float */
> +	case _SMC_KEY("flt "): {
> +		u32 flt_ = 0;
> +
> +		ret = macsmc_hwmon_read_f32_scaled(smc, sensor->macsmc_key,
> +						   &flt_, scale);
		if (ret)
			return ret;

> +		*val = flt_;
> +		break;
> +	}
> +	/* 48.16 fixed point decimal */
> +	case _SMC_KEY("ioft"): {
> +		u64 ioft = 0;
> +
> +		ret = macsmc_hwmon_read_ioft_scaled(smc, sensor->macsmc_key,
> +						    &ioft, scale);
		if (ret)
			return ret;

> +		*val = (long)ioft;
> +		break;
> +	}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (ret)
> +		return -EINVAL;

Drop

> +
> +	return 0;
> +}
> +
> +static int macsmc_hwmon_write_f32_scaled(struct apple_smc *smc, smc_key key,
> +					 int value, int scale)
> +{
> +	u64 val;
> +	u32 fval = 0;
> +	int exp, neg;
> +
> +	val = abs(value);
> +	neg = val != value;
> +
> +	if (scale > 1) {
> +		val <<= 32;
> +		exp = 32;
> +		val /= scale;
> +	} else if (scale < 1) {
> +		val *= -scale;
> +	}
> +
> +	if (val) {
> +		int msb = __fls(val) - exp;
> +
> +		if (msb > 23) {
> +			val >>= msb - 23;
> +			exp -= msb - 23;
> +		} else if (msb < 23) {
> +			val <<= 23 - msb;
> +			exp += msb;
> +		}
> +
> +		fval = FIELD_PREP(FLT_SIGN_MASK, neg) |
> +		       FIELD_PREP(FLT_EXP_MASK, exp + FLT_EXP_BIAS) |
> +		       FIELD_PREP(FLT_MANT_MASK, val);
> +	}
> +
> +	return apple_smc_write_u32(smc, key, fval);
> +}
> +
> +static int macsmc_hwmon_write_key(struct apple_smc *smc,
> +				  struct macsmc_hwmon_sensor *sensor, long val,
> +				  int scale)
> +{
> +	switch (sensor->info.type_code) {
> +	/* 32-bit IEEE 754 float */
> +	case _SMC_KEY("flt "):
> +		return macsmc_hwmon_write_f32_scaled(smc, sensor->macsmc_key,
> +						     val, scale);
> +	/* unsigned 8-bit integer */
> +	case _SMC_KEY("ui8 "):
> +		return apple_smc_write_u8(smc, sensor->macsmc_key, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int macsmc_hwmon_read_fan(struct macsmc_hwmon *hwmon, u32 attr, int chan,
> +				 long *val)
> +{
> +	if (!(hwmon->fan.fans[chan].attrs & BIT(attr)))
> +		return -EINVAL;

This is wrong. If the fan does not exist, the is_visible function should
have dropped the attribute. Also, EINVAL is "invalid argument" which is
just impossible when _reading_ a value from the kernel.

> +
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		return macsmc_hwmon_read_key(hwmon->smc,
> +					     &hwmon->fan.fans[chan].now, 1, val);
> +	case hwmon_fan_min:
> +		return macsmc_hwmon_read_key(hwmon->smc,
> +					     &hwmon->fan.fans[chan].min, 1, val);
> +	case hwmon_fan_max:
> +		return macsmc_hwmon_read_key(hwmon->smc,
> +					     &hwmon->fan.fans[chan].max, 1, val);
> +	case hwmon_fan_target:
> +		return macsmc_hwmon_read_key(hwmon->smc,
> +					     &hwmon->fan.fans[chan].set, 1, val);
> +	default:
> +		return -EINVAL;

As above.

> +	}
> +}
> +
> +static int macsmc_hwmon_write_fan(struct device *dev, u32 attr, int channel,
> +				  long val)
> +{
> +	struct macsmc_hwmon *hwmon = dev_get_drvdata(dev);
> +	long min, max;
> +	int ret;
> +
> +	if (!fan_control || hwmon->fan.fans[channel].mode.macsmc_key == 0)
> +		return -EOPNOTSUPP;
> +
> +	if (channel >= hwmon->fan.count ||
> +	    !(hwmon->fan.fans[channel].attrs & BIT(attr)) ||
> +	    attr != hwmon_fan_target)
> +		return -EINVAL;

And again.

> +
> +	/*
> +	 * The SMC does no sanity checks on requested fan speeds, so we need to.
> +	 */
> +	ret = macsmc_hwmon_read_key(hwmon->smc, &hwmon->fan.fans[channel].min,
> +				    1, &min);
> +	if (ret)
> +		return ret;
> +
> +	ret = macsmc_hwmon_read_key(hwmon->smc, &hwmon->fan.fans[channel].max,
> +				    1, &max);
> +	if (ret)
> +		return ret;
> +
> +	if (val >= min && val <= max) {
> +		if (!hwmon->fan.fans[channel].manual) {
> +			/* Write 1 to mode key for manual control */
> +			ret = macsmc_hwmon_write_key(hwmon->smc,
> +						     &hwmon->fan.fans[channel].mode, 1,
> +						     1);
> +			if (ret < 0)
> +				return ret;
> +
> +			hwmon->fan.fans[channel].manual = true;
> +		}
> +		return macsmc_hwmon_write_key(hwmon->smc,
> +					      &hwmon->fan.fans[channel].set, val, 1);
> +	} else if (!val) {
> +		if (hwmon->fan.fans[channel].manual) {
> +			ret = macsmc_hwmon_write_key(hwmon->smc,
> +						     &hwmon->fan.fans[channel].mode, 0, 1);
> +			if (ret < 0)
> +				return ret;
> +
> +			hwmon->fan.fans[channel].manual = false;
> +		}
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int macsmc_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			     u32 attr, int channel, long *val)
> +{
> +	struct macsmc_hwmon *hwmon = dev_get_drvdata(dev);
> +	int ret = 0;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		ret = macsmc_hwmon_read_key(hwmon->smc,
> +					    &hwmon->temp.sensors[channel], 1000, val);
> +		break;
> +	case hwmon_in:
> +		ret = macsmc_hwmon_read_key(hwmon->smc,
> +					    &hwmon->volt.sensors[channel], 1000, val);
> +		break;
> +	case hwmon_curr:
> +		ret = macsmc_hwmon_read_key(hwmon->smc,
> +					    &hwmon->curr.sensors[channel], 1000, val);
> +		break;
> +	case hwmon_power:
> +		/* SMC returns power in Watts with acceptable precision to scale to uW */
> +		ret = macsmc_hwmon_read_key(hwmon->smc,
> +					    &hwmon->power.sensors[channel],
> +					    1000000, val);
> +		break;
> +	case hwmon_fan:
> +		ret = macsmc_hwmon_read_fan(hwmon, attr, channel, val);
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return ret;
> +}
> +
> +static int macsmc_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +			      u32 attr, int channel, long val)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		return macsmc_hwmon_write_fan(dev, attr, channel, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static umode_t macsmc_hwmon_fan_is_visible(const void *data, u32 attr,
> +					   int channel)
> +{
> +	const struct macsmc_hwmon *hwmon = data;
> +
> +	if (fan_control && attr == hwmon_fan_target &&
> +	    hwmon->fan.fans[channel].mode.macsmc_key != 0)
> +		return 0644;
> +
> +	return 0444;

This should return 0 for non-existing fans.

> +}
> +
> +static umode_t macsmc_hwmon_is_visible(const void *data,
> +				       enum hwmon_sensor_types type, u32 attr,
> +				       int channel)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		return macsmc_hwmon_fan_is_visible(data, attr, channel);
> +	default:
> +		break;
> +	}
> +
> +	return 0444;

If those attributes exist they must be supported. Otherwise return 0.

> +}
> +
> +static const struct hwmon_ops macsmc_hwmon_ops = {
> +	.is_visible = macsmc_hwmon_is_visible,
> +	.read = macsmc_hwmon_read,
> +	.read_string = macsmc_hwmon_read_label,
> +	.write = macsmc_hwmon_write,
> +};
> +
> +/*
> + * Get the key metadata, including key data type, from the SMC.
> + */
> +static int macsmc_hwmon_parse_key(struct device *dev, struct apple_smc *smc,
> +				  struct macsmc_hwmon_sensor *sensor,
> +				  const char *key)
> +{
> +	int ret;
> +
> +	ret = apple_smc_get_key_info(smc, _SMC_KEY(key), &sensor->info);
> +	if (ret) {
> +		dev_err(dev, "Failed to retrieve key info for %s\n", key);
> +		return ret;
> +	}
> +
> +	sensor->macsmc_key = _SMC_KEY(key);
> +
> +	return 0;
> +}
> +
> +/*
> + * A sensor is a single key-value pair as made available by the SMC.
> + * The devicetree gives us the SMC key ID and a friendly name where the
> + * purpose of the sensor is known.
> + */
> +static int macsmc_hwmon_create_sensor(struct device *dev, struct apple_smc *smc,
> +				      struct device_node *sensor_node,
> +				      struct macsmc_hwmon_sensor *sensor)
> +{
> +	const char *key, *label;
> +	int ret;
> +
> +	ret = of_property_read_string(sensor_node, "apple,key-id", &key);
> +	if (ret) {
> +		dev_err(dev, "Could not find apple,key-id in sensor node\n");
> +		return ret;
> +	}
> +
> +	ret = macsmc_hwmon_parse_key(dev, smc, sensor, key);
> +	if (ret)
> +		return ret;
> +
> +	ret = of_property_read_string(sensor_node, "label", &label);
> +	if (ret) {
> +		dev_err(dev, "No label found for sensor %s\n", key);
> +		return ret;
> +	}
> +
> +	strscpy_pad(sensor->label, label, sizeof(sensor->label));
> +
> +	return 0;
> +}
> +
> +/*
> + * Fan data is exposed by the SMC as multiple sensors.
> + *
> + * The devicetree schema reuses apple,key-id for the actual fan speed sensor.
> + * Min, max and target keys do not need labels, so we can reuse label
> + * for naming the entire fan.
> + */
> +static int macsmc_hwmon_create_fan(struct device *dev, struct apple_smc *smc,
> +				   struct device_node *fan_node,
> +				   struct macsmc_hwmon_fan *fan)
> +{
> +	const char *label, *now, *min, *max, *set, *mode;
> +	int ret;
> +
> +	ret = of_property_read_string(fan_node, "apple,key-id", &now);
> +	if (ret) {
> +		dev_err(dev, "apple,key-id not found in fan node!\n");
> +		return -EINVAL;

		return ret;

Never overwrite error numbers.

> +	}
> +
> +	ret = macsmc_hwmon_parse_key(dev, smc, &fan->now, now);
> +	if (ret)
> +		return ret;
> +
> +	ret = of_property_read_string(fan_node, "label", &label);
> +	if (ret) {
> +		dev_err(dev, "No label found for fan %s\n", now);
> +		return ret;
> +	}
> +
> +	strscpy_pad(fan->label, label, sizeof(fan->label));
> +
> +	fan->attrs = HWMON_F_LABEL | HWMON_F_INPUT;
> +
> +	/* The following keys are not required to simply monitor fan speed */
> +	if (!of_property_read_string(fan_node, "apple,fan-minimum", &min)) {
> +		ret = macsmc_hwmon_parse_key(dev, smc, &fan->min, min);
> +		if (ret)
> +			return ret;
> +
> +		fan->attrs |= HWMON_F_MIN;
> +	}
> +
> +	if (!of_property_read_string(fan_node, "apple,fan-maximum", &max)) {
> +		ret = macsmc_hwmon_parse_key(dev, smc, &fan->max, max);
> +		if (ret)
> +			return ret;
> +
> +		fan->attrs |= HWMON_F_MAX;
> +	}
> +
> +	if (!of_property_read_string(fan_node, "apple,fan-target", &set)) {
> +		ret = macsmc_hwmon_parse_key(dev, smc, &fan->set, set);
> +		if (ret)
> +			return ret;
> +
> +		fan->attrs |= HWMON_F_TARGET;
> +	}
> +
> +	if (!of_property_read_string(fan_node, "apple,fan-mode", &mode)) {
> +		ret = macsmc_hwmon_parse_key(dev, smc, &fan->mode, mode);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Initialise fan control mode to automatic */
> +	fan->manual = false;
> +
> +	return 0;
> +}
> +
> +static int macsmc_hwmon_populate_sensors(struct macsmc_hwmon *hwmon,
> +					 struct device_node *hwmon_node)
> +{
> +	struct device_node *key_node __maybe_unused;
> +	u32 n_current = 0, n_fan = 0, n_power = 0, n_temperature = 0, n_voltage = 0;
> +
> +	for_each_child_of_node_with_prefix(hwmon_node, key_node, "current-") {
> +		n_current++;
> +	}
> +
> +	if (n_current) {
> +		hwmon->curr.sensors = devm_kcalloc(hwmon->dev, n_current,
> +						   sizeof(struct macsmc_hwmon_sensor), GFP_KERNEL);
> +		if (!hwmon->curr.sensors)
> +			return -ENOMEM;
> +
> +		for_each_child_of_node_with_prefix(hwmon_node, key_node, "current-") {
> +			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node,
> +							&hwmon->curr.sensors[hwmon->curr.count]))
> +				hwmon->curr.count++;
> +		}
> +	}
> +
> +	for_each_child_of_node_with_prefix(hwmon_node, key_node, "fan-") {
> +		n_fan++;
> +	}
> +
> +	if (n_fan) {
> +		hwmon->fan.fans = devm_kcalloc(hwmon->dev, n_fan,
> +					       sizeof(struct macsmc_hwmon_fan), GFP_KERNEL);
> +		if (!hwmon->fan.fans)
> +			return -ENOMEM;
> +
> +		for_each_child_of_node_with_prefix(hwmon_node, key_node, "fan-") {
> +			if (!macsmc_hwmon_create_fan(hwmon->dev, hwmon->smc, key_node,
> +						     &hwmon->fan.fans[hwmon->fan.count]))
> +				hwmon->fan.count++;
> +		}
> +	}
> +
> +	for_each_child_of_node_with_prefix(hwmon_node, key_node, "power-") {
> +		n_power++;
> +	}
> +
> +	if (n_power) {
> +		hwmon->power.sensors = devm_kcalloc(hwmon->dev, n_power,
> +						    sizeof(struct macsmc_hwmon_sensor), GFP_KERNEL);
> +		if (!hwmon->power.sensors)
> +			return -ENOMEM;
> +
> +		for_each_child_of_node_with_prefix(hwmon_node, key_node, "power-") {
> +			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node,
> +							&hwmon->power.sensors[hwmon->power.count]))
> +				hwmon->power.count++;
> +		}
> +	}
> +
> +	for_each_child_of_node_with_prefix(hwmon_node, key_node, "temperature-") {
> +		n_temperature++;
> +	}
> +
> +	if (n_temperature) {
> +		hwmon->temp.sensors = devm_kcalloc(hwmon->dev, n_temperature,
> +						   sizeof(struct macsmc_hwmon_sensor), GFP_KERNEL);
> +		if (!hwmon->temp.sensors)
> +			return -ENOMEM;
> +
> +		for_each_child_of_node_with_prefix(hwmon_node, key_node, "temperature-") {
> +			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node,
> +							&hwmon->temp.sensors[hwmon->temp.count]))
> +				hwmon->temp.count++;
> +		}
> +	}
> +
> +	for_each_child_of_node_with_prefix(hwmon_node, key_node, "voltage-") {
> +		n_voltage++;
> +	}
> +
> +	if (n_voltage) {
> +		hwmon->volt.sensors = devm_kcalloc(hwmon->dev, n_voltage,
> +						   sizeof(struct macsmc_hwmon_sensor), GFP_KERNEL);
> +		if (!hwmon->volt.sensors)
> +			return -ENOMEM;
> +
> +		for_each_child_of_node_with_prefix(hwmon_node, key_node, "volt-") {
> +			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node,
> +							&hwmon->volt.sensors[hwmon->volt.count]))
> +				hwmon->volt.count++;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/* Create NULL-terminated config arrays */
> +static void macsmc_hwmon_populate_configs(u32 *configs, u32 num_keys, u32 flags)
> +{
> +	int idx;
> +
> +	for (idx = 0; idx < num_keys; idx++)
> +		configs[idx] = flags;
> +}
> +
> +static void macsmc_hwmon_populate_fan_configs(u32 *configs, u32 num_keys,
> +					      struct macsmc_hwmon_fans *fans)
> +{
> +	int idx;
> +
> +	for (idx = 0; idx < num_keys; idx++)
> +		configs[idx] = fans->fans[idx].attrs;
> +}
> +
> +static const struct hwmon_channel_info *const macsmc_chip_channel_info =
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ);
> +
> +static int macsmc_hwmon_create_infos(struct macsmc_hwmon *hwmon)
> +{
> +	struct hwmon_channel_info *channel_info;
> +	int i = 0;
> +
> +	/* chip */
> +	hwmon->channel_infos[i++] = macsmc_chip_channel_info;
> +
> +	if (hwmon->curr.count) {
> +		channel_info = &hwmon->curr.channel_info;
> +		channel_info->type = hwmon_curr;
> +		channel_info->config = devm_kcalloc(hwmon->dev, hwmon->curr.count + 1,
> +						    sizeof(u32), GFP_KERNEL);
> +		if (!channel_info->config)
> +			return -ENOMEM;
> +
> +		macsmc_hwmon_populate_configs((u32 *)channel_info->config,
> +					      hwmon->curr.count,
> +					      (HWMON_C_INPUT | HWMON_C_LABEL));

Unnecessary ()

> +		hwmon->channel_infos[i++] = channel_info;
> +	}
> +
> +	if (hwmon->fan.count) {
> +		channel_info = &hwmon->fan.channel_info;
> +		channel_info->type = hwmon_fan;
> +		channel_info->config = devm_kcalloc(hwmon->dev, hwmon->fan.count + 1,
> +						    sizeof(u32), GFP_KERNEL);
> +		if (!channel_info->config)
> +			return -ENOMEM;
> +
> +		macsmc_hwmon_populate_fan_configs((u32 *)channel_info->config,
> +						  hwmon->fan.count,
> +						  &hwmon->fan);
> +		hwmon->channel_infos[i++] = channel_info;
> +	}
> +
> +	if (hwmon->power.count) {
> +		channel_info = &hwmon->power.channel_info;
> +		channel_info->type = hwmon_power;
> +		channel_info->config = devm_kcalloc(hwmon->dev, hwmon->power.count + 1,
> +						    sizeof(u32), GFP_KERNEL);
> +		if (!channel_info->config)
> +			return -ENOMEM;
> +
> +		macsmc_hwmon_populate_configs((u32 *)channel_info->config,
> +					      hwmon->power.count,
> +					      (HWMON_P_INPUT | HWMON_P_LABEL));

Unnecessary (). Drop everywhere.

> +		hwmon->channel_infos[i++] = channel_info;
> +	}
> +
> +	if (hwmon->temp.count) {
> +		channel_info = &hwmon->temp.channel_info;
> +		channel_info->type = hwmon_temp;
> +		channel_info->config = devm_kcalloc(hwmon->dev, hwmon->temp.count + 1,
> +						    sizeof(u32), GFP_KERNEL);
> +		if (!channel_info->config)
> +			return -ENOMEM;
> +
> +		macsmc_hwmon_populate_configs((u32 *)channel_info->config,
> +					      hwmon->temp.count,
> +					      (HWMON_T_INPUT | HWMON_T_LABEL));
> +		hwmon->channel_infos[i++] = channel_info;
> +	}
> +
> +	if (hwmon->volt.count) {
> +		channel_info = &hwmon->volt.channel_info;
> +		channel_info->type = hwmon_in;
> +		channel_info->config = devm_kcalloc(hwmon->dev, hwmon->volt.count + 1,
> +						    sizeof(u32), GFP_KERNEL);
> +		if (!channel_info->config)
> +			return -ENOMEM;
> +
> +		macsmc_hwmon_populate_configs((u32 *)channel_info->config,
> +					      hwmon->volt.count,
> +					      (HWMON_I_INPUT | HWMON_I_LABEL));
> +		hwmon->channel_infos[i++] = channel_info;
> +	}
> +
> +	return 0;
> +}
> +
> +static int macsmc_hwmon_probe(struct platform_device *pdev)
> +{
> +	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
> +	struct macsmc_hwmon *hwmon;
> +	int ret;
> +
> +	/*
> +	 * The MFD driver will try to probe us unconditionally. Some devices
> +	 * with the SMC do not have hwmon capabilities. Only probe if we have
> +	 * a hwmon node.
> +	 */
> +	if (!pdev->dev.of_node)
> +		return -ENODEV;
> +
> +	hwmon = devm_kzalloc(&pdev->dev, sizeof(*hwmon),
> +			     GFP_KERNEL);
> +	if (!hwmon)
> +		return -ENOMEM;
> +
> +	hwmon->dev = &pdev->dev;
> +	hwmon->smc = smc;
> +
> +	ret = macsmc_hwmon_populate_sensors(hwmon, hwmon->dev->of_node);
> +	if (ret) {
> +		dev_err(hwmon->dev, "Could not populate keys!\n");
> +		return ret;
> +	}
> +
> +	if (!hwmon->curr.count && !hwmon->fan.count &&
> +	    !hwmon->power.count && !hwmon->temp.count &&
> +	    !hwmon->volt.count) {
> +		dev_err(hwmon->dev,
> +			"No valid keys found of any supported type");
> +		return -ENODEV;
> +	}
> +
> +	ret = macsmc_hwmon_create_infos(hwmon);
> +	if (ret)
> +		return ret;
> +
> +	hwmon->chip_info.ops = &macsmc_hwmon_ops;
> +	hwmon->chip_info.info =
> +		(const struct hwmon_channel_info *const *)&hwmon->channel_infos;
> +
> +	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
> +								"macsmc_hwmon", hwmon,
> +								&hwmon->chip_info, NULL);
> +	if (IS_ERR(hwmon->hwmon_dev))
> +		return dev_err_probe(hwmon->dev, PTR_ERR(hwmon->hwmon_dev),
> +				     "Probing SMC hwmon device failed\n");
> +
> +	dev_info(hwmon->dev, "Registered SMC hwmon device. Sensors:");
> +	dev_info(hwmon->dev,
> +		 "Current: %d, Fans: %d, Power: %d, Temperature: %d, Voltage: %d",
> +		 hwmon->curr.count, hwmon->fan.count,
> +		 hwmon->power.count, hwmon->temp.count,
> +		 hwmon->volt.count);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id macsmc_hwmon_of_table[] = {
> +	{ .compatible = "apple,smc-hwmon" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, macsmc_hwmon_of_table);
> +
> +static struct platform_driver macsmc_hwmon_driver = {
> +	.probe = macsmc_hwmon_probe,
> +	.driver = {
> +		.name = "macsmc_hwmon",
> +		.of_match_table = macsmc_hwmon_of_table,
> +	},
> +};
> +module_platform_driver(macsmc_hwmon_driver);
> +
> +MODULE_DESCRIPTION("Apple Silicon SMC hwmon driver");
> +MODULE_AUTHOR("James Calligeros <jcalligeros99@gmail.com>");
> +MODULE_LICENSE("Dual MIT/GPL");
> +MODULE_ALIAS("platform:macsmc_hwmon");
